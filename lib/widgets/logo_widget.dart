import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_path_drawer/common/color_constants.dart';


class LogoWidget extends StatelessWidget {
  final String logoTxt;
  final double fontSize;
  final double height;
  final double width;
  LogoWidget({
    Key key,
    @required this.logoTxt,
    @required this.fontSize,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          logoTxt,
          style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: fontSize,
                color: primaryColor,
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(
          width: 10,
        ),
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            height: height,
            width: width,
            color: primaryColor,
            child: Center(
              child: Container(
                height: 15,
                width: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
