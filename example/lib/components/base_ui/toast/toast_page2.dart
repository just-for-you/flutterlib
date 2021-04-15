import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterlib/flutterlib.dart';

import '../style.dart';

class ToastPage extends StatefulWidget {
  static const String routeName = '/toast2';

  @override
  State<ToastPage> createState() => _ToastPageState();
}

const Color lightBG = Colors.white;
const Color darkBG = Colors.black;
const Color lightBarBG = FLColors.primaryColor;
const Color darkBarBG = Color(0xFF161616);
const Color darkButtonBG = Color.fromRGBO(28, 28, 30, 1);

class _ToastPageState extends State<ToastPage> {

  bool _darkMode = false;
  FLToastStyle _toastStyle = FLToastStyle.dark;
  FLToastPosition _toastPosition = FLToastPosition.center;

  @override
  Widget build(BuildContext context) {
    Widget inset = SizedBox(height: 35); //空白间隔
    Color buttonColor = _darkMode ? darkButtonBG : lightBG;
    Color textColor = _darkMode ? lightBG : lightBarBG;
    TextStyle textStyle = TextStyle(fontSize: 15);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _darkMode ? darkBarBG : lightBarBG,
          title: Text("Toast"),
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: _darkMode ? darkBG : lightBG,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    inset,
                    SizedBox(
                      width: 280,
                      child: OutlineButton(
                        color: buttonColor,
                        textColor: textColor,
                        child: Text('Toast Center Blue, fontSize 15', style: textStyle),
                        onPressed: (){
                          FlutterToast.showToast(
                              msg: "Toast Center Blue, fontSize 15",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,  // 消息框弹出的位置
                              timeInSecForIos: 1,  // 消息框持续的时间（目前的版本只有ios有效）
                              backgroundColor: Colors.blue,
                              textColor: Colors.orange,
                              fontSize: 15.0
                          );
                        },
                      ),
                    ),
                    inset,
                    SizedBox(
                      width: 280,
                      child: OutlineButton(
                        color: buttonColor,
                        textColor: textColor,
                        child: Text('Toast Center Black, fontSize 16', style: textStyle),
                        onPressed: () {
                          FlutterToast.showToast(
                              msg: "Toast Center Black, fontSize 16",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,  // 消息框弹出的位置
                              timeInSecForIos: 1,  // 消息框持续的时间（目前的版本只有ios有效）
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        },
                      ),
                    ),
                    inset,
                    SizedBox(
                      width: 280,
                      child: OutlineButton(
                        color: buttonColor,
                        textColor: textColor,
                        child: Text('Toast BOTTOM Grey, TextColor white', style: textStyle),
                        onPressed: () {
                          FlutterToast.showToast(
                              msg: "Toast BOTTOM Grey, TextColor white",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,  // 消息框弹出的位置
                              timeInSecForIos: 1,  // 消息框持续的时间（目前的版本只有ios有效）
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
