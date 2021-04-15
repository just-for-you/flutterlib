import 'package:flutter/material.dart';
import 'package:flutterlib_example/comon_widget/list_view_item.dart';
import 'package:flutterlib_example/routers/routers_config.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage(this.title);
  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage> {
  List<Widget> _items = [];

  /// 每个item的样式
  Widget makeCard(element){
    var title = element['title'];
    var subTitle = 'eg: ${element['data']}';
    var route = element['route'];
    return ListViewItem(itemRoute:route, itemTitle: title, data: subTitle,);
  }

  @override
  void initState() {
    super.initState();
    homeItemInfo.forEach((element) {
      _items.add(makeCard(element));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _items,
        ),
      ),
    );
  }
}
