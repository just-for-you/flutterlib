import 'package:flutter/material.dart';
import 'package:flutterlib/flutterlib.dart';

import 'component/card.dart';

class HorizontalScrollDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: HorizontalScrollView(
        itemCount: 10,
        footerWidth: 70,
        height: 160,
        footerView: FooterDefaultView(height: 160),
        onFooterLoadingCallBack: () {
          print('开始加载回调');
        },
        itembuilder: (context, index) {
          return CardWidget.card(Color.fromRGBO(254, 241, 238, 1));
        },
      ),
    );
  }
}
