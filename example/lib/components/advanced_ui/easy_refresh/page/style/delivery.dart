import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';
import 'package:flutterlib_example/comon_widget/sample_list_item.dart';

/// 快递气球样式
class DeliveryPage extends StatefulWidget {
  @override
  DeliveryPageState createState() {
    return DeliveryPageState();
  }
}

class DeliveryPageState extends State<DeliveryPage> {
  // 总数
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Delivery'),
        backgroundColor: Colors.blue,
      ),
      body: EasyRefresh.custom(
        header: DeliveryHeader(
          backgroundColor: Colors.grey[100],
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
