import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadingProgressDemo extends StatefulWidget {
  static const String routeName = '/loading_progress';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<LoadingProgressDemo> {

  @override
  Widget build(BuildContext context) {
    Widget inset = SizedBox(height: 15, width: double.infinity,); //空白间隔
    return Scaffold(
        appBar: AppBar(
          title: Text("loading_progress"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            inset,
            Text(
              "1.LinearProgressIndicator水平进度指示器",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            inset,
            Container(
              width: 200.0,
              child: LinearProgressIndicator(),
            ),
            inset,
            Text("设置具体进度值：value:0.5 范围是0-1"),
            inset,
            Container(
              width: 200.0,
              child: LinearProgressIndicator(
                value: 0.5,
              ),
            ),
            inset,
            Text("设置背景颜色及进度值：greenAccent, value:0.8"),
            inset,
            Container(
              width: 200.0,
              child: LinearProgressIndicator(
                value: 0.8,
                backgroundColor: Colors.greenAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
            inset,
            Text(
              "2.CircularProgressIndicator圆形进度条",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            inset,
            Container(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange, valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            inset,
            Text(
              "3.CupertinoActivityIndicator loading指示器",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            inset,
            SizedBox(
              height: 30,
              width: 30,
              child: CupertinoActivityIndicator(
                radius: 30,
              ),
            ),
            inset,
            inset,
            Text(
              "4.RefreshProgressIndicator 刷新指示器",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            inset,
            SizedBox(
              height: 50,
              width: 50,
              child: RefreshProgressIndicator(
                backgroundColor: Colors.greenAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                strokeWidth: 3.0,
              ),
            ),
            Loading(indicator: BallPulseIndicator(),
                size: 100.0,
                color: Colors.pink),
            RaisedButton(
                //padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //padding
                child: Text(
                  '点我显示 Loading',
                  style: TextStyle(
                    fontSize: 15.0, //textsize
                    color: Colors.white, // textcolor
                  ),
                ),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                //shadow
                splashColor: Colors.blueGrey,
                onPressed: () {
                  showLoading(context);
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.of(context).pop();//关闭对话框
                  });
                }),
          ],
        ));
  }
}
