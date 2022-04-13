import 'package:Portfolio/constants.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            children: [
              AboutTextSign(),
              Expanded(
                  child: Text(
                      "Occaecat incididunt occaecat amet ea enim voluptate nisi excepteur reprehenderit.")),
              ExperienceCard(
                numExperience: "10",
              ),
              Expanded(
                  child: Text(
                      "Occaecat incididunt occaecat amet ea enim voluptate nisi excepteur reprehenderit.")),
            ],
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomOutlineButton(
                imgSrc: "assets/images/hand.png",
                text: "Hire Me!",
                onPressed: () {},
              ),
              SizedBox(
                width: kDefaultPadding * 2,
              ),
              DefaultButton()
            ],
          )
        ],
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String text, assetsPath;
  final Function press;
  const DefaultButton({
    Key key, this.text, this.assetsPath, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Color(0xffe8f0f9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 2,
            vertical: kDefaultPadding),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
             assetsPath,
              height: 40,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Text(text)
          ],
        ));
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String imgSrc, text;
  final Function onPressed;

  const CustomOutlineButton({
    Key key,
    this.imgSrc,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: OutlineButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        borderSide: BorderSide(color: Color(0xffededed)),
        child: Row(
          children: [
            Image.asset(imgSrc),
            SizedBox(
              width: kDefaultPadding,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String numExperience;
  const ExperienceCard({
    Key key,
    this.numExperience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      height: 240,
      width: 255,
      decoration: BoxDecoration(
          color: Color(0xfff7e8ff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 6,
                color: Color(0xffa600ff).withOpacity(0.25))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Text(
                numExperience,
                style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color(0xffdfa3ff).withOpacity(0.5),
                    shadows: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 10,
                          color: Color(0xffa600ff).withOpacity(0.5))
                    ]),
              ),
              Text(
                numExperience,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            "Years of Experience",
            style: TextStyle(color: Color(0xffa600ff)),
          )
        ],
      ),
    );
  }
}

class AboutTextSign extends StatelessWidget {
  const AboutTextSign({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About \nmy story",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        Image.asset("assets/images/sign.png")
      ],
    );
  }
}
