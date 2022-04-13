import 'package:flutter/material.dart';
import 'package:flutter_responsive_web_app/enums/enum_type.dart';

class ScreenSizeInfo{
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  ScreenSizeInfo({this.orientation, this.deviceScreenType, this.screenSize, this.localWidgetSize});

  @override
  String toString() {
    return 'Orientation:$orientation DeviceScreenType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}