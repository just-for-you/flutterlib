import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

enum ENV {
  PRODUCTION,
  DEV,
}

class Application {
  /// 通过Application设计环境变量
  static ENV env = ENV.PRODUCTION;

  static Router router;
  static TabController controller;
  static bool pageIsOpen = false;

  static Map<String, String> github = {
    'widgetsURL':
        'https://github.com/alibaba/flutter-go/blob/develop/lib/widgets/',
  };

  /// 所有获取配置的唯一入口
  Map<String, String> get config {
    if (Application.env == ENV.PRODUCTION) {
      return {};
    }
    if (Application.env == ENV.DEV) {
      return {};
    }
    return {};
  }

}
