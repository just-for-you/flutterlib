import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../utils/analytics.dart' show analytics;
import 'index.dart';
import 'router_handler.dart';

class Routes {

  static String root = "/";
  static String baseUI = "/base_ui";
  static String advancedUI = '/advanced_ui';
  static String function = '/function';
  static String business = '/business';

  static String webViewPage = '/webview';

  //配置路由
  static void configureRoutes(Router router) {
    router.define(baseUI, handler: baseUIPageHandler);
    router.define(advancedUI, handler: advancedUIPageHandler);
    router.define(function, handler: functionPageHandler);
    router.define(business, handler: businessPageHandler);
    router.define(webViewPage, handler: webViewPageHandler);

    List widgetDemosList = new WidgetDemoList().getDemos();
    widgetDemosList.forEach((demo) {
      Handler handler = Handler(handlerFunc:(BuildContext context, Map<String, List<String>> params) {
        print('组件路由params=$params, widgetsItem=${demo.routerName}');
        analytics.logEvent(name: 'component', parameters: {'name': demo.routerName});
        return demo.buildRouter(context);
      });
      String path = demo.routerName;
      router.define(path, handler: handler);
      //router.define('${path.toLowerCase()}', handler: handler);
    });
  }


}
