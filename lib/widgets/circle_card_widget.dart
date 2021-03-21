import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_path_drawer/common/color_constants.dart';


class CircleCardWidget extends StatefulWidget {
  final String iconImg;
  final String nameTxt;
  final Duration delayStart;

  CircleCardWidget({
    Key key,
    @required this.iconImg,
    this.nameTxt,
    this.delayStart,
  }) : super(key: key);

  @override
  _CircleCardWidgetState createState() => _CircleCardWidgetState();
}

class _CircleCardWidgetState extends State<CircleCardWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animation = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    Timer(widget.delayStart, () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(
                    widget.iconImg,
                    height: 25,
                    width: 25,
                    color: Color(0XFF203782),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              widget.nameTxt,
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 12,
                    color: primaryColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
