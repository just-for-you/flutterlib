
import 'advanced_ui/index.dart' as advanced;
import 'base_ui/index.dart' as base;
import 'function/index.dart' as function;
import 'business/index.dart' as business;

List getWidgets() {
  List result = [];
  result
    ..addAll(base.widgetPoints)
    ..addAll(advanced.widgetPoints)
    ..addAll(function.getWidgets())
    ..addAll(business.getWidgets());
  return result;
}
