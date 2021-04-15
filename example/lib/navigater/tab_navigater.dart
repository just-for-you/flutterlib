import 'package:flutter/material.dart';

import 'doc/doc.dart';
import 'flyWidgets/widget_list.dart';
import 'home/tab_home_page.dart';
import 'my/my.dart';
import 'package:flutterlib_example/routers/routers_config.dart';

// 首页Tab Widget
// ignore: must_be_immutable
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {

  List<Widget> _pages = [];
  List<BottomNavigationBarItem> _tabs = [];
  var _currentIndex = 0;
  var _currentTitle = tabInfo[0]['title'];

  final _defaultColor = const Color(0xff8a8a8a);
  final _activeColor = const Color(0xff50b4ed);
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // 初始化，这个函数在生命周期中调用一次
    super.initState();

    // pages页面
    _pages
      ..add(HomePage(_currentTitle))
      ..add(ListPage())
      ..add(Doc(mdPath: 'doc/magpie_ui.md',))
      ..add(My());

    // tab列表
    tabInfo.forEach((element) {
      _tabs.add(BottomNavigationBarItem(
          title: Text(element['tabTitle'],),
          icon: element['icon'],
          activeIcon: element['selectIcon']));
    });
    /*for (var i = 0; i < tabInfo.length; i++) {
        Map map = tabInfo[i];
        _tabs.add(BottomNavigationBarItem(
            title: Text(map['tabTitle'],),
            icon: map['icon'],
            activeIcon: map['selectIcon']));
    }*/
  }

  @override
  void didChangeDependencies() {
    // 在initState之后调
    // Called when a dependency of this [State] object changes.
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // 销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentTitle)),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      /*body: PageView(
        controller: _controller,
        children: _pages,
        onPageChanged: onPageChanged,
        //physics: NeverScrollableScrollPhysics(), //所有可滚动组件的属性physics，禁止滑动
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs,
        currentIndex: _currentIndex, //高亮  被点击高亮
        onTap: tabClick, //点击监听
        type: BottomNavigationBarType.fixed, //shifting :按钮点击移动效果，fixed：固定
        selectedFontSize: 12,
        unselectedFontSize: 12,
        /*selectedLabelStyle: TextStyle(
            fontSize: 12,
            color: _activeColor
        ),
        unselectedLabelStyle: TextStyle(
            fontSize: 12,
            color: _defaultColor
        ),*/
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _currentTitle = tabInfo[index]['title'];
    });
  }

  void tabClick(int index) {
    //_controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
      _currentTitle = tabInfo[index]['title'];
    });
  }

}
