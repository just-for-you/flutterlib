import 'package:flutter/material.dart';
import 'package:flutterlib_example/components/advanced_ui/easy_refresh/page/refresh_home.dart';
import 'package:flutterlib_example/components/base_ui/bottom_sheet/bottom_sheet_demo.dart';
import 'package:flutterlib_example/components/base_ui/dialog/dialog_demo.dart';
import 'package:flutterlib_example/components/base_ui/loading_progress/loading_progress_page.dart';
import 'package:flutterlib_example/components/base_ui/marquee/marquee_demo.dart';
import 'package:flutterlib_example/components/base_ui/title_bar/title_bar_demo.dart';
import 'package:flutterlib_example/components/base_ui/dialog/dialog_demo.dart';
import 'package:flutterlib_example/components/base_ui/snack_bar/snack_bar.dart';
import 'package:flutterlib_example/components/base_ui/toast/toast_page.dart' as Toast;
import 'package:flutterlib_example/components/function/city_select/city_select_custom_header.dart';
import 'package:flutterlib_example/routers/routers.dart';

// 首页导航tabInfo
List<Map<String, dynamic>> tabInfo = [
  {
    'title': 'Home Widget List',
    'tabTitle': 'Home',
    'icon': Image.asset('assets/images/tab_nomal1.png', width: 23, height: 23),
    'selectIcon': Image.asset('assets/images/tab_selected1.png', width: 23, height: 23)
  },
  {
    'title': 'Magpie Fly Widget',
    'tabTitle': 'Widget',
    'icon': Image.asset('assets/images/tab_nomal2.png', width: 23, height: 23),
    'selectIcon': Image.asset('assets/images/tab_selected2.png', width: 23, height: 23)
  },
  {
    'title': 'Doc',
    'tabTitle': 'Doc',
    'icon': Image.asset('assets/images/tab_nomal3.png', width: 23, height: 23),
    'selectIcon': Image.asset('assets/images/tab_selected3.png', width: 23, height: 23)
  },
  {
    'title': 'My',
    'tabTitle': 'My',
    'icon': Image.asset('assets/images/tab_nomal4.png', width: 23, height: 23),
    'selectIcon': Image.asset('assets/images/tab_selected4.png', width: 23, height: 23)
  },
];

// home首页列表itemInfo
List<Map<String, String>> homeItemInfo = [
  {
    'route': '${Routes.baseUI}',
    'title': '基础UI组件',
    'data': "loading,dialog,text......",
  },
  {
    'route': '${Routes.advancedUI}',
    'title': '高级UI组件',
    'data': "banner,list,......",
  },
  {
    'route': '${Routes.function}',
    'title': '功能组件',
    'data': "sp,net,route......",
  },
  {
    'route': '${Routes.business}',
    'title': '业务组件',
    'data': "page,picker......",
  },
];


// home首页高级UI组件 itemInfo
List<Map<String, String>> advancedUiListData = [
  {
    "route": "${RefreshHomePage.routeName}",
    "title": "EasyRefresh组件",
    "desc": "easy_refresh",
  },
];


// home首页高级UI组件 itemInfo
List<Map<String, String>> baseUiListData = [
  {
    "route": "${Toast.ToastPage.routeName}",
    "title": "Toast组件",
    "desc": "toast by flutter",
  },
  {
    "route": "${LoadingProgressDemo.routeName}",
    "title": "LoadingProgress组件",
    "desc": "各种加载进度指示器",
  },
  {
    "route": "${DialogDemo.routeName}",
    "title": "Dialog组件",
    "desc": "各种Dialog",
  },
  {
    "route": "${BottomSheetDemo.routeName}",
    "title": "BottomSheet组件",
    "desc": "底页：各种底部弹出的工具条",
  },
  {
    "route": "${SnackBarActionDemo.routeName}",
    "title": "SnackBar组件",
    "desc": "轻量级屏幕底部消息",
  },
  {
    "route": "${MarqueeDemo.routeName}",
    "title": "Marquee组件",
    "desc": "跑马灯组件",
  },
  {
    "route": "${TitleBarDemo.routeName}",
    "title": "titleBar组件",
    "desc": "标题栏组件",
  },
];


// home首页功能组件 itemInfo
List<Map<String, String>> functionListData = [
  {
    "route": "${Routes.webViewPage}",
    "title": "WebView组件",
    "desc": "WebView by flutter",
  },
  {
    "route": "${CitySelectCustomHeaderRoute.routeName}",
    "title": "城市选择组件",
    "desc": "city select custom header",
  },
];
