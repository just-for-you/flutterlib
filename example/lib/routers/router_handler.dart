import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutterlib_example/components/base_ui/base_ui_page.dart';
import 'package:flutterlib_example/components/advanced_ui/advanced_ui_page.dart';
import 'package:flutterlib_example/components/business/business_page.dart';
import 'package:flutterlib_example/components/function/function_page.dart';
import 'package:flutterlib/flutterlib.dart';

//基础UI组件
var baseUIPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BaseUIPage();
  },
);

//高级UI组件
var advancedUIPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AdvancedUIPage();
});

//功能组件
var functionPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FunctionPage();
});

//业务组件
var businessPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //String ids = params["ids"]?.first;
    return BusinessPage();
  },
);


var webViewPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    final String title = params['title']?.first;
    final String url = params['url']?.first;
    return WebViewPage(title: title, url: url);
  },
);

