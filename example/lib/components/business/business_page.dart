import 'package:flutter/material.dart';
import 'package:flutterlib_example/routers/routers_config.dart';

class BusinessPage extends StatefulWidget {
  @override
  BusinessList createState() => BusinessList();
}

class BusinessList extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BusinessList Widgets'),
      ),
      body: Center(
        child: Text('Running on: BusinessList\n'),
      ),
    );
  }
}
