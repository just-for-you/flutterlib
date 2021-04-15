import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';
import 'title_bar.dart';

///跑马灯测试页面
class TitleBarDemo extends StatefulWidget {
  static const String routeName = '/title_bar_demo';
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<TitleBarDemo> {

  ///初始化状态数据
  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar().titleBar(context, 'TitleBar',),
      backgroundColor: Color(0xF3f3f3f3),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "1.通用的titleBar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            TitleBar().titleBar(context, '意见反馈'),
            SizedBox(
              height: 30,
            ),
            Text(
              "2.右侧有按钮的titleBar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            TitleBar().titleBar(context, '意见反馈',rightText: "提交", onRightPressed:(){
              FLToast.text(text: '按钮被点击');
            }),
          ],
        ),
    );
  }
}