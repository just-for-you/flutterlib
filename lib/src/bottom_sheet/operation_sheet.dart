import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlib/src/widgets/image.dart';

import '../../flutterlib.dart';

const double _kSectionHeight = 120;
const double _kSectionInsetVertical = 10;
const double _kItemSpacing = 0;
const double _kItemImageSize = 56;

const Color _kTextColor = Color.fromARGB(255, 93, 93, 93);

/// The operation sheet is based on [CupertinoActionSheet].
class OperationSheet extends StatelessWidget {
  OperationSheet({
    Key key,
    this.borderRadius,
    this.sheetStyle,
    this.backgroundColor,
    this.cancelButton,
    this.header,
    @required this.itemList,
  })  : assert(itemList != null && itemList.length > 0),
        super(key: key);

  final BorderRadius borderRadius;
  final ActionSheetStyle sheetStyle;
  final Color backgroundColor;
  final CupertinoActionSheetAction cancelButton;

  final Widget header;
  final List<List<OperationSheetItem>> itemList;

  List<Widget> _buildAllSections() {
    List<Widget> children = [];
    // add header
    if (header != null) {
      children.add(header);
      children.add(Divider(height: 1));
    }
    // add items
    int sectionCount = itemList.length;
    for (int i = 0; i < sectionCount; i++) {
      List list = itemList[i];
      Widget section = _buildSection(list);
      children.add(section);
      if (i != sectionCount - 1) {
        children.add(Divider(height: 1));
      }
    }
    return children;
  }

  Widget _buildSection(List<OperationSheetItem> list) {
    return Container(
      height: _kSectionHeight,
      child: GridView(
        padding: EdgeInsets.symmetric(
            vertical: _kSectionInsetVertical,
            horizontal: _kSectionInsetVertical),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: _kItemSpacing,
            childAspectRatio: 6 / 5),
        children: list,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ActionSheet(
        style: sheetStyle ?? ActionSheetStyle.roundedCard,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor ?? Color(0xD1F8F8F8),
        cancelButton: cancelButton,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildAllSections(),
          ),
        ));
  }
}

class OperationSheetItem extends StatelessWidget {
  OperationSheetItem({
    Key key,
    this.imagePath,
    this.highlightImagePath,
    this.title,
    this.onPressed,
    this.customChild,
  })  : assert((imagePath != null && title != null && onPressed != null) ||
            customChild != null),
        super(key: key);

  final String imagePath;
  final String highlightImagePath;
  final String title;
  final VoidCallback onPressed;
  final Widget customChild;

  Widget _buildImageTitleItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FLImage(
          borderRadius: BorderRadius.circular(10),
          image: AssetImage(imagePath),
          width: _kItemImageSize,
          height: _kItemImageSize,
          fit: BoxFit.fill,
          onPressed: onPressed,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: _kTextColor,
            decoration: TextDecoration.none,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = this.customChild ?? _buildImageTitleItem();
    return ClipRect(
      child: Container(child: child),
    );
  }
}
