import 'package:Portfolio/constants.dart';
import 'package:Portfolio/sections/service.dart';
import 'package:flutter/material.dart';
import 'about_section.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(
            0xffe8f0f9,
          ),
          image:
              DecorationImage(image: AssetImage("assets/images/bg_img_2.png"))),
      child: Column(
        children: [
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Project Inquiry and Infomation",
            color: Color(0xff07e24a),
          ),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            margin: EdgeInsets.only(top: kDefaultPadding * 2),
            constraints: BoxConstraints(maxWidth: 1110),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  children: [
                    SocialCard(
                      name: "The Flutter Design",
                      color: Color(0xffd9fffc),
                      imgSrc: "assets/images/skype.png",
                    ),
                    SocialCard(
                      name: "The Flutter Design",
                      color: Color(0xffe4ffc7),
                      imgSrc: "assets/images/whatsapp.png",
                    ),
                    SocialCard(
                      name: "The Flutter Design",
                      color: Color(0xffd9fffc),
                      imgSrc: "assets/images/messanger.png",
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
                ContactForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding,
        children: [
          SizedBox(
            width: 480,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Your Name", hintText: "Enter Your Name"),
            ),
          ),
          SizedBox(
            width: 480,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Email", hintText: "Enter Your Email"),
            ),
          ),
          SizedBox(
            width: 480,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Project Type", hintText: "Select Project Type"),
            ),
          ),
          SizedBox(
            width: 480,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Project Budget", hintText: "Enter Your Budget"),
            ),
          ),
          SizedBox(
            width: 480,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Description", hintText: "Enter Your Description"),
            ),
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Center(
            child: FittedBox(
              child: DefaultButton(
                assetsPath: "assets/images/contact_icon.png",
                text: "Contact Me!",
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SocialCard extends StatefulWidget {
  final Color color;
  final String name, imgSrc;
  const SocialCard({
    Key key,
    this.color,
    this.name,
    this.imgSrc,
  }) : super(key: key);

  @override
  _SocialCardState createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2, horizontal: kDefaultPadding * 1.5),
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [if (isHover) kDefaultCardShadow]),
          child: Row(
            children: [
              Image.asset(
                widget.imgSrc,
                height: 80,
                width: 80,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Text(widget.name)
            ],
          ),
        ),
      ),
    );
  }
}
