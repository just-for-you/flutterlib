import 'dart:async';

import 'package:flutter/services.dart';
export 'src/popup_window/popup_window.dart';
export 'src/horizontal_scroll/horizontal_scroll.dart';
export 'src/horizontal_scroll/footer_view.dart';
export 'src/feed/scroll_detect_listener.dart';
export 'src/feed/meta_consumer.dart';
export 'src/feed/video_play_model.dart';
export 'src/feed/video_meta.dart';
export 'src/sliver/pinned_appbar.dart';
export 'src/sliver/safearea_header.dart';
export 'src/search_input/search_input.dart';
export 'src/drag/draggable_btn.dart';
export 'src/banner/banner_round.dart';
export 'src/easy_refresh/easy_refresh.dart';
export 'src/toast/toast.dart';
export 'src/toast/flutter_toast.dart';
export 'src/loading/loading_dialog.dart';
export 'src/dialog/base_dialog.dart';
export 'res/res.dart';
export 'src/webview/webview_page.dart';
export 'src/bottom_sheet/action_sheet.dart';
export 'src/bottom_sheet/operation_sheet.dart';


class Flutterlib {
  //和native通讯， 这个值必须是唯一的，并且在使用到的Native层和Flutter层互相对应
  //注册渠道：在两端同时创建一个MethodChannel对象，注册相同的字符串值。
  //native:MethodChannel channel = new MethodChannel(binaryMessenger, 'flutterlib');
  static const MethodChannel _channel = const MethodChannel('flutterlib');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
