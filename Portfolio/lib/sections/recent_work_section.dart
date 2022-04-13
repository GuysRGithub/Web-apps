import 'package:Portfolio/constants.dart';
import 'package:Portfolio/models/RecentWork.dart';
import 'package:Portfolio/sections/about_section.dart';
import 'package:flutter/material.dart';
import 'package:Portfolio/sections/service.dart';

class RecentWorkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding * 6),
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
          color: Color(0xfff7e8ff).withOpacity(.3),
          image: DecorationImage(
              image: AssetImage("assets/images/recent_work_bg.png"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Transform.translate(
            child: HireMeCard(),
            offset: Offset(0, -80),
          ),
          SectionTitle(
            title: "Recent Work",
            subTitle: "My Strong Areas",
            color: Color(0xfffb100),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          SizedBox(
            width: 1110,
            child: Wrap(
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                  recentWorks.length,
                  (index) => RecentWorkCard(
                        index: index,
                      )),
            ),
          ),
          SizedBox(
            height: kDefaultPadding * 5,
          )
        ],
      ),
    );
  }
}

class RecentWorkCard extends StatefulWidget {
  final int index;
  final Function press;
  const RecentWorkCard({
    Key key,
    this.index, this.press,
  }) : super(key: key);

  @override
  _RecentWorkCardState createState() => _RecentWorkCardState();
}

class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 320,
        width: 540,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [isHover ? kDefaultCardShadow : null]),
        child: Row(
          children: [
            Image.asset(recentWorks[widget.index].image),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recentWorks[widget.index].category.toUpperCase()),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text(
                    recentWorks[widget.index].title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(height: 1.5),
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text(
                    "View Details",
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class HireMeCard extends StatelessWidget {
  const HireMeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [kDefaultShadow]),
      child: Row(
        children: [
          Image.asset(
            "assets/images/email.png",
            height: 80,
            width: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 80,
              child: VerticalDivider(),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                "Starting New Project?",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "get an estimate for the new project",
                style: TextStyle(fontWeight: FontWeight.w200),
              )
            ],
          )),
          DefaultButton(
            text: "Hire me!",
            assetsPath: "assets/images/hand.png",
            press: () {},
          )
        ],
      ),
    );
  }
}
