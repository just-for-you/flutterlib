import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';
import 'package:flutterlib_example/comon_widget/sample_list_item.dart';

/// BezierHourGlass样式
class BezierHourGlassPage extends StatefulWidget {
  @override
  BezierHourGlassPageState createState() {
    return BezierHourGlassPageState();
  }
}

class BezierHourGlassPageState extends State<BezierHourGlassPage> {
  // 总数
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BezierHourGlass'),
        backgroundColor: Colors.blue,
      ),
      body: EasyRefresh.custom(
        header: BezierHourGlassHeader(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        footer: BezierBounceFooter(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
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
