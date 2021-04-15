import '../components/index.dart' as components;

class WidgetDemoList {
  WidgetDemoList();

  List getDemos() {
    List result = [];
    result.addAll(components.getWidgets());
    return result;
  }
}
