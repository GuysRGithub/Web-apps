import 'package:Portfolio/constants.dart';
import 'package:Portfolio/models/Feedback.dart';
import 'package:Portfolio/sections/service.dart';
import 'package:flutter/material.dart';

class FeedbackSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            title: "Feedback Received",
            subTitle: "Client's testimations that inspired me a lot",
            color: Color(0xff0081ff),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                feedbacks.length,
                (index) => FeedbackCard(
                      index: index,
                    )),
          )
        ],
      ),
    );
  }
}

class AnimatedHoverWrapper extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const AnimatedHoverWrapper({Key key, this.duration, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FeedbackCard extends StatefulWidget {
  final int index;
  const FeedbackCard({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  _FeedbackCardState createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  bool isHover;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(top: kDefaultPadding * 3),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 350,
        width: 350,
        decoration: BoxDecoration(
            color: feedbacks[widget.index].color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [if (isHover) kDefaultCardShadow]),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(0, -55),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 10),
                    boxShadow: [if (!isHover) kDefaultCardShadow],
                    image: DecorationImage(
                        image: AssetImage(feedbacks[widget.index].userPic))),
              ),
            ),
            Text(
              feedbacks[widget.index].review,
              style: TextStyle(
                  color: kTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  height: 1.5),
            ),
            SizedBox(
              height: kDefaultPadding * 2,
            ),
            Text(
              feedbacks[widget.index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
