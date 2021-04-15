
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterlib_example/Constant/common.dart';
import 'package:flutterlib_example/utils/log_utils.dart';
import 'base_entity.dart';
import 'error_handle.dart';


int _connectTimeout = 15000;
int _receiveTimeout = 15000;
int _sendTimeout = 10000;
String _baseUrl;
List<Interceptor> _interceptors = [];

/// 初始化Dio配置
void setInitDio({
  int connectTimeout,
  int receiveTimeout,
  int sendTimeout,
  String baseUrl,
  List<Interceptor> interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

/// @weilu https://github.com/simplezhli
class DioUtils {

  static final DioUtils _singleton = DioUtils._();
  
  static DioUtils get instance => DioUtils();

  factory DioUtils() => _singleton;

  static Dio _dio;

  Dio get dio => _dio;

  DioUtils._() {
    var _options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      responseType: ResponseType.plain,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: _baseUrl,
//  contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'),
    );
    _dio = Dio(_options);
    /// Fiddler抓包代理配置 https://www.jianshu.com/p/d831b1f7c45b
//    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//        (HttpClient client) {
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return 'PROXY 10.41.0.132:8888';
//      };
//      client.badCertificateCallback =
//          (X509Certificate cert, String host, int port) => true;
//    };
    /// 添加拦截器
    _interceptors.forEach((interceptor) {
      _dio.interceptors.add(interceptor);
    });
  }

  // 数据返回格式统一，统一处理异常
  Future<BaseEntity<T>> _request<T>(String method, String url, {
    dynamic data, Map<String, dynamic> queryParameters,
    CancelToken cancelToken, Options options
  }) async {
    final Response response = await _dio.request(url, data: data, queryParameters: queryParameters, options: _checkOptions(method, options), cancelToken: cancelToken);
    try {
      /// 集成测试无法使用 isolate https://github.com/flutter/flutter/issues/24703
      Map<String, dynamic> _map = Constant.isDriverTest ? parseData(response.data.toString()) : await compute(parseData, response.data.toString());
      return BaseEntity.fromJson(_map);
    } catch(e) {
      print(e);
      return BaseEntity(ExceptionHandle.parse_error, '数据解析错误', null);
    }
  }

  Options _checkOptions(String method, Options options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  Future requestNetwork<T>(Method method, String url, {
    Function(T t) onSuccess,
    Function(List<T> list) onSuccessList,
    Function(int code, String msg) onError,
    dynamic params, Map<String, dynamic> queryParameters,
    CancelToken cancelToken, Options options, bool isList : false
  }) {
    String m = _getRequestMethod(method);
    return _request<T>(m, url,
        data: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken).then((BaseEntity<T> result) {
      if (result.code == 0) {
        if (isList) {
          if (onSuccessList != null) {
            onSuccessList(result.listData);
          }
        } else {
          if (onSuccess != null) {
            onSuccess(result.data);
          }
        }
      } else {
        _onError(result.code, result.message, onError);
      }
    }, onError: (e, _) {
      _cancelLogPrint(e, url);
      NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  /// 统一处理(onSuccess返回T对象，onSuccessList返回List<T>)
  void asyncRequestNetwork<T>(Method method, String url, {
    Function(T t) onSuccess, 
    Function(List<T> list) onSuccessList, 
    Function(int code, String msg) onError,
    dynamic params, Map<String, dynamic> queryParameters, 
    CancelToken cancelToken, Options options, bool isList : false
  }) {
    String m = _getRequestMethod(method);
    Stream.fromFuture(_request<T>(m, url, data: params, queryParameters: queryParameters, options: options, cancelToken: cancelToken))
        .asBroadcastStream()
        .listen((result) {
      if (result.code == 0) {
        if (isList) {
          if (onSuccessList != null) {
            onSuccessList(result.listData);
          }
        } else {
          if (onSuccess != null) {
            onSuccess(result.data);
          }
        }
      } else {
        _onError(result.code, result.message, onError);
      }
    }, onError: (e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  void _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      Log.e('取消请求接口： $url');
    }
  }

  void _onError(int code, String msg, Function(int code, String mag) onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = '未知异常';
    }
    Log.e('接口请求异常： code: $code, mag: $msg');
    if (onError != null) {
      onError(code, msg);
    }
  }

  String _getRequestMethod(Method method) {
    String m;
    switch(method) {
      case Method.get:
        m = 'GET';
        break;
      case Method.post:
        m = 'POST';
        break;
      case Method.put:
        m = 'PUT';
        break;
      case Method.patch:
        m = 'PATCH';
        break;
      case Method.delete:
        m = 'DELETE';
        break;
      case Method.head:
        m = 'HEAD';
        break;
    }
    return m;
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data);
}

enum Method {
  get,
  post,
  put,
  patch,
  delete,
  head
}