import 'package:flutter/material.dart';

class Landscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pages(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            children: pages(constraints.biggest.width),
          );
        }
      },
    );
  }
}

List<Widget> pages(double width) {
  return <Widget>[
    Container(
    width: width,
    child: Padding(
      padding: const EdgeInsets.only(left: 64),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Websites \nDevelopers",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "We have taken each every project handle over us as a challagen, which has halped us a bit",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.pink,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                "Start Now",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          ]),
    )),
    Image.asset(
      'images/image.png',
      width: width,
    )
  ];
}
