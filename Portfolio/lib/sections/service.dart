import 'package:Portfolio/constants.dart';
import 'package:Portfolio/models/Service.dart';
import 'package:flutter/material.dart';

class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            subTitle: "My Strong Areas",
            title: " OfferiServicengs",
            color: Color(0xffff0000),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                services.length,
                (index) => ServiceCard(
                      index: index,
                    )),
          )
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key key,
    this.index,
  }) : super(key: key);
  final int index;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      child: InkWell(
        onTap: () {},
        onHover: (value) => {
          setState(() {
            isHover = value;
          })
        },
        hoverColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding * 1.5),
          height: 256,
          width: 256,
          decoration: BoxDecoration(
              color: services[widget.index].color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [isHover ? kDefaultCardShadow : null]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      isHover
                          ? null
                          : BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 30,
                              color: Colors.black.withOpacity(0.1))
                    ]),
                child: Image.asset(
                  services[widget.index].image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                services[widget.index].title,
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title, subTitle;
  final Color color;
  const SectionTitle({
    Key key, this.title, this.subTitle, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: EdgeInsets.only(bottom: 72),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 100,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          ),
          Column(
            children: [
              Text(
                subTitle,
                style:
                    TextStyle(fontWeight: FontWeight.w200, color: kTextColor),
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
