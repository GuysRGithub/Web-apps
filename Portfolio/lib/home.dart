import 'package:Portfolio/constants.dart';
import 'package:Portfolio/sections/about_section.dart';
import 'package:Portfolio/sections/feed_back_section.dart';
import 'package:Portfolio/sections/recent_work_section.dart';
import 'package:Portfolio/sections/service.dart';
import 'package:Portfolio/sections/top_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          TopSection(),
          SizedBox(height: kDefaultPadding * 2,),
          AboutSection(),
          SizedBox(height: 500,),
          ServiceSection(),
          SizedBox(height: kDefaultPadding,),
          RecentWorkSection(),
          SizedBox(height: kDefaultPadding,),
          FeedbackSection(),
          SizedBox(height: kDefaultPadding,)
        ],
      ),),
    );
  }
}