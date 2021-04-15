import 'dart:core';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterlib_example/routers/application.dart';

// item 卡片形式
class ListViewItem extends StatelessWidget {

  final String itemRoute;
  final String itemTitle;
  final String data;

  const ListViewItem({Key key, this.itemRoute, this.itemTitle, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          //transition 转场动画
          Application.router.navigateTo(context, itemRoute/*'${Routes.baseUI}'*/,
              transition: TransitionType.nativeModal);
        },
        title: Padding(
          child: Text(
            itemTitle,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(data,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}
