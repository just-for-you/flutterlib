import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';
import 'package:flutterlib_example/comon_widget/sample_list_item.dart';

/// 冲上云霄样式
class TaurusPage extends StatefulWidget {
  @override
  TaurusPageState createState() {
    return TaurusPageState();
  }
}

class TaurusPageState extends State<TaurusPage> {
  // 总数
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taurus'),
        backgroundColor: Colors.blue,
      ),
      body: EasyRefresh.custom(
        header: TaurusHeader(),
        footer: TaurusFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count += 20;
              });
            }
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SampleListItem();
              },
              childCount: _count,
            ),
          ),
        ],
      ),
    );
  }
}
