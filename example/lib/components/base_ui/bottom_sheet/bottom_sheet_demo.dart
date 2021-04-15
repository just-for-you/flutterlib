import 'package:flutterlib/flutterlib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  static const String routeName = '/bottom_sheet';

  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetDemo> {

  Widget _buildActionSheetContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/poster.png'),
          SizedBox(height: 15),
          Text(
            'Flutter Interact is here! Check out the livestream.\nFlutter 1.12 is live! Check out the latest announcement and see what\'s new on the site.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomSheet'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              // ActionSheet - Filled
              Container(
                width: 200,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('ActionSheet - Filled'),
                  onPressed: () {
                    showFLBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ActionSheet(
                            style: ActionSheetStyle.filled,
                            child: _buildActionSheetContent(),
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('Cancel'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            ),
                          );
                        }).then((value) {
                      print(value);
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              // ActionSheet - Rounded
              Container(
                width: 200,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('ActionSheet - Rounded'),
                  onPressed: () {
                    showFLBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ActionSheet(
                            child: _buildActionSheetContent(),
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('Cancel'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            ),
                          );
                        }).then((value) {
                      print(value);
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              // OperationSheet
              Container(
                width: 200,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('OperationSheet'),
                  onPressed: () {
                    showFLBottomSheet(
                        context: context,
                        builder: (context) => _buildOperationSheetContent(context),
                    ).then((value) => FLToast.info(text: value));
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildOperationSheetContent(context) {
    return OperationSheet(
      backgroundColor: Color(0xFFFAFAFA),
      sheetStyle: ActionSheetStyle.filled,
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      ),
      header: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Text('Share', style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
      ),
      itemList: [
        [
          OperationSheetItem(
            imagePath: 'assets/images/google.png',
            title: 'Google',
            onPressed: () {
              Navigator.pop(context, 'Google');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/share_friend.png',
            title: 'Wechat',
            onPressed: () {
              Navigator.pop(context, 'Wechat');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/instagram.png',
            title: 'Instagram',
            onPressed: () {
              Navigator.pop(context, 'Instagram');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/twitter.png',
            title: 'Twitter',
            onPressed: () {
              Navigator.pop(context, 'Twitter');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/whatsapp.png',
            title: 'Whatsapp',
            onPressed: () {
              Navigator.pop(context, 'Whatsapp');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/word.png',
            title: 'Office',
            onPressed: () {
              Navigator.pop(context, 'Office');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/share_weibo.png',
            title: 'Weibo',
            onPressed: () {
              Navigator.pop(context, 'Weibo');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/omnifocus.png',
            title: 'Omni',
            onPressed: () {
              Navigator.pop(context, 'Omni');
            },
          ),
        ],
        [
          OperationSheetItem(
            imagePath: 'assets/images/messages.png',
            title: 'Messages',
            onPressed: () {
              Navigator.pop(context, 'Messages');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/mail.png',
            title: 'Mail',
            onPressed: () {
              Navigator.pop(context, 'Mail');
            },
          ),
          OperationSheetItem(
            imagePath: 'assets/images/keynote.png',
            title: 'Keynote',
            onPressed: () {
              Navigator.pop(context, 'Keynote');
            },
          ),
        ]
      ],
    );
  }


}