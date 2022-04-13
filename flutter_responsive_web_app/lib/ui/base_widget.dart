import 'package:flutter/material.dart';
import 'package:flutter_responsive_web_app/ui/screen_size_info.dart';


class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenSizeInfo screenSizeInfo) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenSizeInfo = ScreenSizeInfo(
      orientation: mediaQuery.orientation
    );
    return builder(context, screenSizeInfo);
  }
}