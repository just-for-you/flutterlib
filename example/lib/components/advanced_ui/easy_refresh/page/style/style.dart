import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';
import 'package:flutterlib_example/comon_widget/circular_icon.dart';
import 'package:flutterlib_example/comon_widget/list_item.dart';
import 'package:flutterlib_example/components/advanced_ui/easy_refresh/page/sample/basic.dart';
import 'package:flutterlib_example/components/advanced_ui/easy_refresh/page/style/phoenix.dart';
import 'package:flutterlib_example/components/advanced_ui/easy_refresh/page/style/space.dart';
import 'package:flutterlib_example/components/advanced_ui/easy_refresh/page/style/taurus.dart';
import 'package:flutterlib_example/generated/i18n.dart';

import 'ball_pulse.dart';
import 'bezier_circle.dart';
import 'bezier_hour_glass.dart';
import 'bob_minion.dart';
import 'delivery.dart';
import 'material.dart';

/// 样式页面
class StylePage extends StatefulWidget {
  @override
  _StylePageState createState() => _StylePageState();
}

class _StylePageState extends State<StylePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 100.0,
            pinned: true,
            backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(S.of(context).style),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // 经典样式
              ListItem(
                title: S.of(context).classic,
                describe: S.of(context).classicDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BasicPage(S.of(context).classic);
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Theme.of(context).primaryColor,
                  icon: Icons.format_list_bulleted,
                ),
              ),
              // 质感设计
              ListItem(
                title: 'Material',
                describe: S.of(context).materialDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MaterialPage2();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.pink,
                  icon: Icons.android,
                ),
              ),
              // 球脉冲
              ListItem(
                title: 'BallPulse',
                describe: S.of(context).ballPulseDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BallPulsePage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.blue,
                  icon: Icons.lens,
                ),
              ),
              // 弹出圆圈
              ListItem(
                title: 'BezierCircle',
                describe: S.of(context).bezierCircleDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BezierCirclePage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.green,
                  icon: Icons.radio_button_checked,
                ),
              ),
              // BezierHourGlass
              ListItem(
                title: 'BezierHourGlass',
                describe: S.of(context).bezierHourGlassDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BezierHourGlassPage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.teal,
                  icon: Icons.timelapse,
                ),
              ),
              // 冲上云霄
              ListItem(
                title: 'Taurus',
                describe: S.of(context).taurusDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TaurusPage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.lightBlue,
                  icon: Icons.airplanemode_active,
                ),
              ),
              // 金色校园
              ListItem(
                title: 'Phoenix',
                describe: S.of(context).phoenixDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PhoenixPage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.amber[700],
                  icon: Icons.location_city,
                ),
              ),
              // 快递气球
              ListItem(
                title: 'Delivery',
                describe: S.of(context).deliveryDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return DeliveryPage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.red,
                  icon: Icons.cloud,
                ),
              ),
              // 星空
              ListItem(
                title: 'Space',
                describe: S.of(context).spaceDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SpacePage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.blue,
                  icon: Icons.stars,
                ),
              ),
              // 小黄人
              ListItem(
                title: S.of(context).bobMinion,
                describe: S.of(context).bobMinionDescribe,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BobMinionPage();
                    },
                  ));
                },
                icon: CircularIcon(
                  bgColor: Colors.amber[600],
                  icon: Icons.accessibility,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
