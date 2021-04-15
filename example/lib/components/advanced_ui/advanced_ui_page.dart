import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterlib_example/routers/application.dart';
import 'package:flutterlib_example/routers/fluro_navigator.dart';
import 'package:flutterlib_example/routers/routers_config.dart';

class AdvancedUIPage extends StatefulWidget {
  @override
  AdvancedUIList createState() => AdvancedUIList();
}

class AdvancedUIList extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AdvancedUI")),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: advancedUiListData.length,
        itemBuilder: (context, index) {
          Map map = advancedUiListData[index];
          String name = map['desc'] ?? '';//如果为空取空字符串
          return ListTile(
            trailing: Icon(Icons.chevron_right, color: Color(0xffCCCCCC)),
            title: Text(map['title'], style: TextStyle(color: Color(0xff333333), fontSize: 16)),
            subtitle: Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(name, style: TextStyle(color: Color(0xff999999), fontSize: 12)),
            ),
            onTap: () {
              _cellOnTap(context, map);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(height: 1),
      ),
    );
  }

  void _cellOnTap(BuildContext context, Map map) {
    var route = map['route'];
    var title = map['title'];
    NavigatorUtils.push(context, route);
  }

}
