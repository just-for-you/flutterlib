import 'package:flutter/material.dart';

// 屏幕底部消息
// 带有可选操作的轻量级消息，短暂显示在屏幕底部
// 用户操作后，显示提示信息的一个控件，类似Toast，会自动隐藏
class SnackBarActionDemo extends StatefulWidget {
  static const String routeName = '/snack_bar';

  _DemoState createState() => _DemoState();
}



// 官方API文档Scaffold的of方法说明有说明调用Scaffold.of方法是在Scallfold的子组件的Build方法中，
// 也就是不能直接在构建Scaffold的build方法里调用，否则会抛异常。
// Typical usage of the Scaffold.of function is to call it
// from within the build method of a child of a Scaffold.

// 解决方法一：Scaffold的子组件通过Builder构建
// 这时候要不就是按官方的，将需要显示SnackBar的代码另外抽离一个自定义子组件，在子组件的build方法再显示SnackBar，
// 要不就是在Scaffold的build方法体对该子组件再包一层Builder，如下所示。

// 解决方法二：使用GlobalKey存储ScaffoldState
class _DemoState extends State<SnackBarActionDemo> {
  // 需要设置Scaffold的key才能弹出SnackBar
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('BottomSheet'),
        ),
        //在子组件外再包一层builder，让context不共用
        //body: Builder(builder: (context) {
        //return Center(
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            new RaisedButton(
              onPressed: () {
                final snackBar = new SnackBar(
                  content: new Text('这是一个SnackBar, 右侧有SnackBarAction, 3秒后消失'),
                  backgroundColor: Color(0xffc91b3a),
                  action: SnackBarAction(
                    // 提示信息上添加一个撤消的按钮
                    textColor: Colors.white,
                    label: '撤消',
                    onPressed: () {
                      // Some code to undo the change!
                    },
                  ),
                  duration: Duration(seconds: 3), // 持续时间
                  //animation,
                );
                _scaffoldKey.currentState.showSnackBar(snackBar);
                // 直接在Scallfold的build方法里使用会抛异常
                // 下面这种方法是不可用的(当BuildContext在Scaffold之前时，调用Scaffold.of(context)会报错)
                // Scaffold.of(context).showSnackBar(snackBar);
              },
              child: Text('点我显示有action的SnackBar'),
            ),
            SizedBox(height: 20),
            new RaisedButton(
              onPressed: () async {
                final snackBar = new SnackBar(
                  content: new Text('右侧无SnackBarAction, 3秒后消失'),
                  backgroundColor: Color(0xffc91b3a),
                  duration: Duration(seconds: 3), // 持续时间
                  //animation,
                );
                _scaffoldKey.currentState.showSnackBar(snackBar);
              },
              child: Text('点我显示无SnackBarAction的SnackBar'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                final snackBar = SnackBar(
                  content: Text('这是一个SnackBar, 右侧有SnackBarAction'),
                  backgroundColor: Colors.red,
                  action: SnackBarAction(
                    // 提示信息上添加一个撤消的按钮
                    textColor: Colors.black,
                    label: '撤消',
                    onPressed: () {
                      // Some code to undo the change!
                    },
                  ),
                  duration: Duration(minutes: 1), // 持续时间
                  //animation,
                );
                _scaffoldKey.currentState.showSnackBar(snackBar);
              },
              child: Text('显示SnackBar'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                final snackBar = SnackBar(
                  content: Text('右侧无SnackBarAction'),
                  backgroundColor: Colors.red,
                  duration: Duration(minutes: 1), // 持续时间
                  //animation,
                );
                _scaffoldKey.currentState.showSnackBar(snackBar);
              },
              child: Text('显示无SnackBarAction的SnackBar'),
            ),
          ],
        )));
  }
}
