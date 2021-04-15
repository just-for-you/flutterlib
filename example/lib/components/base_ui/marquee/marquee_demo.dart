import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'marquee.dart';

///跑马灯测试页面
class MarqueeDemo extends StatefulWidget {
  static const String routeName = '/marquee_demo';
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MarqueeDemo> {

  ///初始化状态数据
  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跑马灯"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Color(0xF3f3f3f3),
      body:  Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "1.上下方向跑马灯效果展示",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 200,
                height: 20,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFFFFFFFF),
                ),
                child: Marquee(3, _rankItemBuilder),
              ),
          ],
        ),
      ),
    );
  }

  Widget _rankItemBuilder(BuildContext context, int index){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: Image.network("https://accounts.processon.com/uphoto/1/98/58aa4919e4b07158582714ea.png"
              ,width: 16,height: 16,),
          ),

          SizedBox(height: 16.0), // 图片下面预留的高度
          Text(
              "index${index}titletitlet",
              style:TextStyle(
                fontSize: 12,
                color: Color(0xFFFF552E),
              )
          ),
        ],
      ),
    );
  }
}