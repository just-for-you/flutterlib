import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';
import 'update_dialog.dart';
import 'exit_dialog.dart';

class DialogDemo extends StatefulWidget {
  static const String routeName = '/dialog';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    Widget inset = SizedBox(
      height: 25,
      width: double.infinity,
    ); //空白间隔
    return Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            inset,
            RaisedButton(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //padding
                child: Text(
                  'AlertDialog',
                  style: TextStyle(
                    fontSize: 18.0, //textsize
                    color: Colors.white, // textcolor
                  ),
                ),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                //shadow
                splashColor: Colors.blueGrey,
                onPressed: () {
                  showAlertDialog(context);
                }),
            inset,
            RaisedButton(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //padding
                child: Text(
                  'AboutDialog',
                  style: TextStyle(
                    fontSize: 18.0, //textsize
                    color: Colors.white, // textcolor
                  ),
                ),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                //shadow
                splashColor: Colors.blueGrey,
                onPressed: () {
                  showAboutDialog(context);
                }),
            inset,
            RaisedButton(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //padding
                child: Text(
                  'SimpleDialog',
                  style: TextStyle(
                    fontSize: 18.0, //textsize
                    color: Colors.white, // textcolor
                  ),
                ),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                //shadow
                splashColor: Colors.blueGrey,
                onPressed: () {
                  showSimpleDialog(context);
                }),
            inset,
            RaisedButton(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //padding
                child: Text(
                  'CommonDialog',
                  style: TextStyle(
                    fontSize: 18.0, //textsize
                    color: Colors.white, // textcolor
                  ),
                ),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                //shadow
                splashColor: Colors.blueGrey,
                onPressed: () {
                  showCommonDialog(context);
                }),
            inset,
            RaisedButton(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //padding
                child: Text(
                  'CustomLoadingDialog',
                  style: TextStyle(
                    fontSize: 18.0, //textsize
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
                    Navigator.of(context).pop(); //关闭退出对话框
                  });
                }),
            inset,
            RaisedButton(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                //padding
                child: Text(
                  'ExitDialog',
                  style: TextStyle(
                    fontSize: 18.0, //textsize
                    color: Colors.white, // textcolor
                  ),
                ),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                //shadow
                splashColor: Colors.blueGrey,
                onPressed: () => _showExitDialog(),
            ),
            inset,
            RaisedButton(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              //padding
              child: Text(
                'UpdateDialog',
                style: TextStyle(
                  fontSize: 18.0, //textsize
                  color: Colors.white, // textcolor
                ),
              ),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              //shadow
              splashColor: Colors.blueGrey,
              onPressed: () => _showUpdateDialog(),
            ),
          ],
        ));
  }

  /// AlertDialog报警对话框:元素过长时，优先考虑SingleChildScrollView避免内容溢出，
  /// 通常使用child大小调整自身，所以使用一些（Listview,GridView和CustomScrollView将无法工作）
  void showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'AlertDialog报警对话框:元素过长时，优先考虑SingleChildScrollView避免内容溢出，通常使用child大小调整自身，所以使用一些（Listview,GridView和CustomScrollView将无法工作）'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// AboutDialog 通常用于传递企业或者app的官方信息
  /// 这个对话框包含应用程序的图标，名称，版本号，版权和应用程序使用到的软件许可证的按钮
  void showAboutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AboutDialog(
            applicationName: '名称',
            applicationIcon: Icon(Icons.ac_unit),
            applicationVersion: 'V1.0',
            children: <Widget>[Text('我是一个关于的dialog')]));
  }

  /// common通用dialog : Dialog向用户传递信息的弹出层。
  /// 可以通过自定义样式, 去完成自己想要的各种样式的弹框, 满足我们的个性化需求
  /// 注意事项: 当前弹出的dialog并非是一个单纯的组件, 而是一个新路由界面, 如果我想通过操作dialog中的内容, 直接使用setState触发的是原界面中的状态
  int value = 0;

  void showCommonDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return StatefulBuilder(builder: (context, state) {
            return Dialog(
              child: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('我是一个dialog'),
                    RaisedButton(
                      onPressed: () {
                        state(() {
                          value += 1;
                        });
                      },
                      child: Text("我是一个Dialog, 点我更新value: $value"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("取消"),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  /// SimpleDialog 是一个用于向用户传递确定信息并提供选项的弹出层
  /// SimpleDialog 可为用户提供多个选项选择。有一个可选的标题，显示在选项上方
  void showSimpleDialog(BuildContext context) {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('选择'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('选项 1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: Text('选项 2'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showExitDialog() {
    showDialog(
        context: context,
        builder: (_) => ExitDialog()
    );
  }

  void _showUpdateDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => UpdateDialog()
    );
  }

}
