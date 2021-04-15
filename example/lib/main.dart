import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterlib/flutterlib.dart';
import 'package:flutterlib_example/routers/application.dart';
import 'package:flutterlib_example/routers/routers.dart';
import 'package:flutterlib_example/utils/event.dart';

import 'generated/i18n.dart';
import 'navigater/tab_navigater.dart';

void main() {
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    statusBarColor: Colors.transparent,
//    statusBarBrightness: Brightness.dark,
//    statusBarIconBrightness: Brightness.dark,
//  ));
//  debugPaintBaselinesEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugPaintPointersEnabled = true;
//  debugRepaintRainbowEnabled = true;
//  debugRepaintTextRainbowEnabled = true;
//  debugCheckElevationsEnabled = true;
//  debugPrintMarkNeedsLayoutStacks = true;
//  debugPrintMarkNeedsPaintStacks = true;
//  debugPrintLayouts = true;
//  debugCheckIntrinsicSizes = true;
//  debugDisableClipLayers = true;
//  debugDisablePhysicalShapeLayers = true;
//  debugDisableOpacityLayers = true;

  //debugPaintSizeEnabled = true; //布局线
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp() {
    // 初始化路由配置
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  FLToastDefaults _toastDefaults = FLToastDefaults();

  @override
  void initState() {
    super.initState();
    initPlatformState();

    eventBus.on().listen((event) {
      if (event.runtimeType == FLToastDefaults) {
        setState(() => _toastDefaults = event);
      }
      if (event == 'reset') {
        setState(() => _toastDefaults = FLToastDefaults());
      }
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Flutterlib.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FLToastProvider(
        defaults: _toastDefaults,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FlutterPluginDemo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'PingFang',
          ),
          home: TabNavigator(),
          localizationsDelegates: [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          localeResolutionCallback: S.delegate.resolution(),
        ));
  }
}
