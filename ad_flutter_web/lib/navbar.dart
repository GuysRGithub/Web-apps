
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final navItems = ["Home", "Products", "Features", "Contact"];
  List<Widget> getNavItems() {
    return navItems
        .map((item) => Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                item,
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 60, right: 60, top: 26),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle,
                
          ),
          child: Image.asset("images/beach.jpg"),
          )],
      ),
    );
  }
}
