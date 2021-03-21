import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData leadingIcon;
  final FocusNode focusNode;
  final IconData suffixIcon;
  final bool obscureText;

  TextFormFieldWidget({
    Key key,
    this.controller,
    @required this.leadingIcon,
    @required this.focusNode,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: focusNode,
      builder: (context, child) {
        return Transform.scale(
          scale: focusNode.hasFocus ? 1.1 : 1,
          child: child,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        elevation: 5,
        child: TextFormField(
          textAlign: TextAlign.start,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            prefixIcon: Icon(
              leadingIcon,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
