import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterlib_example/comon_widget/markdown_page.dart';
import 'list_datas.dart';

class ListPage extends StatelessWidget {

  void _cellOnTap(BuildContext context, Map map) {
    var markdown = map['markdown'];
    var title = map['title'];

    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              tooltip: "ajk",
              icon: Icon(Icons.info),
              onPressed: _intentToAjk,
            )
          ],
        ),
        body: MarkdownPage(filePath: markdown),
      );
    }));
  }

  _intentToAjk() async {
    if (Platform.isAndroid) {
      //跳转到安居客
      /*AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data:'openanjuke://jump/app/main_tab_page?main_tab=youliao&sub_tab=focus',
      );
      await intent.launch();*/
    }else{
      //todo iOS
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          Map map = listData[index];
          String name = map['name'] ?? '';
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

}
