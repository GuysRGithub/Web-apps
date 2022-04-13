import 'package:flutter/material.dart';
import 'package:flutter_responsive_web_app/ui/base_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, screenSizeInfo) {
        return Scaffold(
          body: Center(
            child: Text(screenSizeInfo.toString()),
          ),
        );
      },
    );
  }
}
