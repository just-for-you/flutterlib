import 'package:flutter/material.dart';
import 'package:flutterlib_example/model/widget.dart';

import 'city_select/city_select_custom_header.dart';


List getWidgets() {
  List<WidgetPoint> widgetPoints = [
    WidgetPoint(
      name: 'CitySelect',
      routerName: CitySelectCustomHeaderRoute.routeName,
      buildRouter: (BuildContext context) => CitySelectCustomHeaderRoute(),
    ),
  ];
  return widgetPoints;
}
