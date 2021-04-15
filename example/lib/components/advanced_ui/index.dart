import "package:flutter/material.dart";
import 'package:flutterlib_example/model/widget.dart';

import 'easy_refresh/page/refresh_home.dart' as RefreshHome;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'EasyRefresh',
    routerName: RefreshHome.RefreshHomePage.routeName,
    buildRouter: (BuildContext context) => RefreshHome.RefreshHomePage(),
  ),
];