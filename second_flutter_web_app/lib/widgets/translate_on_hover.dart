import 'package:flutter/material.dart';

class TranslateHover extends StatefulWidget {
  final Widget child;
  TranslateHover({Key key, this.child}) : super(key: key);
  @override
  _TranslateHoverState createState() => _TranslateHoverState();
}

class _TranslateHoverState extends State<TranslateHover> {
  final nonTransformHover = Matrix4.identity();
  final transformHover = Matrix4.identity()..translate(0, -12, 0);

  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => enterHover(true),
      onExit: (e) => enterHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: _hovering ? transformHover : nonTransformHover,
        child: Opacity(
          child: widget.child,
          opacity: _hovering ? 1 : 0.8,
        ),
      ),
    );
  }

  void enterHover(bool isHovering) {
    setState(() {
      _hovering = isHovering;
    });
  }
}
