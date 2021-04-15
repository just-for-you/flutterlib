import "package:flutter/material.dart";
import 'package:flutterlib_example/components/base_ui/marquee/marquee_demo.dart';
import 'package:flutterlib_example/components/base_ui/snack_bar/snack_bar.dart';
import 'package:flutterlib_example/components/base_ui/title_bar/title_bar_demo.dart';
import 'package:flutterlib_example/model/widget.dart';

import 'bottom_sheet/bottom_sheet_demo.dart';
import 'loading_progress/loading_progress_page.dart';
import 'dialog/dialog_demo.dart';
import 'toast/toast_page.dart' as Toast;
import 'toast/toast_page2.dart' as Toast2;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Toast',
    routerName: Toast.ToastPage.routeName,
    buildRouter: (BuildContext context) => Toast.ToastPage(),
  ),
  WidgetPoint(
    name: 'Toast2',
    routerName: Toast2.ToastPage.routeName,
    buildRouter: (BuildContext context) => Toast2.ToastPage(),
  ),
  WidgetPoint(
    name: 'LoadingProgress',
    routerName: LoadingProgressDemo.routeName,
    buildRouter: (BuildContext context) => LoadingProgressDemo(),
  ),
  WidgetPoint(
    name: 'DialogDemo',
    routerName: DialogDemo.routeName,
    buildRouter: (BuildContext context) => DialogDemo(),
  ),
  WidgetPoint(
    name: 'BottomSheet',
    routerName: BottomSheetDemo.routeName,
    buildRouter: (BuildContext context) => BottomSheetDemo(),
  ),
  WidgetPoint(
    name: 'SnackBar',
    routerName: SnackBarActionDemo.routeName,
    buildRouter: (BuildContext context) => SnackBarActionDemo(),
  ),
  WidgetPoint(
    name: 'MarqueeDemo',
    routerName: MarqueeDemo.routeName,
    buildRouter: (BuildContext context) => MarqueeDemo(),
  ),
  WidgetPoint(
    name: 'TitleBarDemo',
    routerName: TitleBarDemo.routeName,
    buildRouter: (BuildContext context) => TitleBarDemo(),
  ),
];