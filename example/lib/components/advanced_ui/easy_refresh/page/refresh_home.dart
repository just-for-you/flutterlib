import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterlib/flutterlib.dart';
import 'package:flutterlib_example/components/advanced_ui/easy_refresh/page/sample/sample.dart';
import 'package:flutterlib_example/components/advanced_ui/easy_refresh/page/style/style.dart';
import 'package:flutterlib_example/generated/i18n.dart';

import 'more/more.dart';

/// 主页面
class RefreshHomePage extends StatefulWidget {
  static const String routeName = '/advanced_ui/easy_refresh';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<RefreshHomePage> {
  // 页面控制
  PageController _pageController;

  // 当前页面
  int _pageIndex = 0;

  // 初始化
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      // 设置EasyRefresh的默认样式
      EasyRefresh.defaultHeader = ClassicalHeader(
        enableInfiniteRefresh: false,
        refreshText: S.of(context).pullToRefresh,
        refreshReadyText: S.of(context).releaseToRefresh,
        refreshingText: S.of(context).refreshing,
        refreshedText: S.of(context).refreshed,
        refreshFailedText: S.of(context).refreshFailed,
        noMoreText: S.of(context).noMore,
        infoText: S.of(context).updateAt,
      );
      EasyRefresh.defaultFooter = ClassicalFooter(
        enableInfiniteLoad: true,
        loadText: S.of(context).pushToLoad,
        loadReadyText: S.of(context).releaseToLoad,
        loadingText: S.of(context).loading,
        loadedText: S.of(context).loaded,
        loadFailedText: S.of(context).loadFailed,
        noMoreText: S.of(context).noMore,
        infoText: S.of(context).updateAt,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 底部栏切换
  void _onBottomNavigationBarTap(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[SamplePage(), StylePage(), /*MorePage()*/],
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        onTap: _onBottomNavigationBarTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text(S.of(context).sample)),
          BottomNavigationBarItem(
              icon: Icon(Icons.style), title: Text(S.of(context).style)),
          /*BottomNavigationBarItem(
              icon: Icon(Icons.more_vert), title: Text(S.of(context).more)),*/
        ],
      ),
    );
  }
}
