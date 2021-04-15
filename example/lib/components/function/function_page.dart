import 'package:flutter/material.dart';
import 'package:flutterlib_example/routers/fluro_navigator.dart';
import 'package:flutterlib_example/routers/routers.dart';
import 'package:flutterlib_example/routers/routers_config.dart';


class FunctionPage extends StatefulWidget {
  @override
  FunctionListState createState() => FunctionListState();
}

class FunctionListState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FunctionComponents")),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: functionListData.length,
        itemBuilder: (context, index) {
          Map map = functionListData[index];
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
    if (route == Routes.webViewPage) {
      NavigatorUtils.goWebViewPage(context, 'WebView Test', 'https://bj.58.com/');
    } else {
      NavigatorUtils.push(context, route);
    }
  }

}
