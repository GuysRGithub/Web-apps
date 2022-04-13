import 'dart:ui';

import 'package:Portfolio/components/glass_content.dart';
import 'package:Portfolio/constants.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 900, minHeight: 700),
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/background.png"))),
      child: Container(
        width: 1200,
        margin: EdgeInsets.only(top: kDefaultPadding),
        child: Stack(
          children: [
            LogoAndBlur(size: size),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  constraints: BoxConstraints(maxHeight: 860, maxWidth: 640),
                  child: Image.asset("assets/images/person.png"),
                )),
            Positioned(child: Menu())
          ],
        ),
      ),
    );
  }
}

class LogoAndBlur extends StatelessWidget {
  const LogoAndBlur({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/logo.png"),
        Spacer(),
        GlassContent(size: size),
        Spacer(),
      ],
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;

  var menuItems = ["About", "Serbices", "Portfolio", "Testimonial", "Contact"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      constraints: BoxConstraints(maxHeight: 1110),
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [kDefaultShadow],
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            List.generate(menuItems.length, (index) => buildMenuItem(index)),
      ),
    );
  }

  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        onHover: (value) {
          value ? hoverIndex = index : hoverIndex = selectedIndex;
        },
        child: Container(
            constraints: BoxConstraints(minWidth: 112),
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  menuItems[index],
                  style: TextStyle(fontSize: 20, color: kTextColor),
                ),
                // Hover
                AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: selectedIndex != index && hoverIndex == index
                        ? -20
                        : -32,
                    child: Image.asset("assets/images/Hover.png")),
                // Selected
                AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: selectedIndex == index ? -2 : -32,
                    child: Image.asset("assets/images/Hover.png"))
              ],
            )),
      );
}
