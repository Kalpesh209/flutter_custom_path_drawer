import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_custom_path_drawer/common/color_constants.dart';
import 'package:flutter_custom_path_drawer/screens/dashboard_screen.dart';
import 'package:flutter_custom_path_drawer/widgets/flat_button_widget.dart';
import 'package:flutter_custom_path_drawer/widgets/logo_widget.dart';
import 'package:flutter_custom_path_drawer/widgets/textform_field_widget.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final FocusNode _namefocusNode = FocusNode();
  final FocusNode _passwordfocusNode = FocusNode();
  AnimationController _animationController;
  Animation<double> _innerAnimation;
  Animation<double> _outerAnimation;

  bool _showForeground = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _innerAnimation = Tween<double>(
      begin: 0,
      end: 0.4,
    ).animate(_animationController);

    _outerAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.addListener(() {
      if (_animationController.value > 0.5) {
        setState(() {
          _showForeground = true;
        });
      } else {
        setState(() {
          _showForeground = false;
        });
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _namefocusNode.dispose();
    _passwordfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AnimatedBuilder(
                  animation: _outerAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: _outerAnimation.value,
                      child: child,
                    );
                  },
                  child: CustomPaint(
                    painter: DrawTriangle(
                      primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AnimatedBuilder(
                  animation: _innerAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: 1 - _innerAnimation.value,
                      child: child,
                    );
                  },
                  child: CustomPaint(
                    painter: DrawTriangle(Colors.white),
                  ),
                ),
              ),
            ),
            !_showForeground
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.1,
                          ),
                          child: Hero(
                            tag: 'Logo',
                            child: LogoWidget(
                              logoTxt: "LOGO",
                              fontSize: 40,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormFieldWidget(
                              leadingIcon: Icons.perm_identity,
                              focusNode: _namefocusNode,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormFieldWidget(
                              focusNode: _passwordfocusNode,
                              leadingIcon: Icons.lock_outline,
                              suffixIcon: Icons.info_outline,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            FlatButtonWidget(
                              btnTxt: "Login",
                              btnOnTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                /* setState(() {
                      _showForeground = false;
                    });
                    _animationController.reverse(); */
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DashBoardScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Expanded(
                          child: _buildNavigation(),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.remove_red_eye,
            size: 20,
            color: Colors.grey,
          ),
          Icon(
            Icons.crop_square,
            size: 20,
            color: primaryColor,
          ),
          Icon(
            Icons.email,
            size: 20,
            color: Colors.grey,
          ),
          Icon(
            Icons.place,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class DrawTriangle extends CustomPainter {
  final Color color;

  DrawTriangle(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final outerTraingleHeight = size.width * 0.9;
    final outerTraingleWidth = size.height;

    List<Offset> outerTrianglePoints = [
      Offset(0, 0),
      Offset(outerTraingleHeight, outerTraingleWidth / 2),
      Offset(0, size.height),
    ];

    var paint = Paint()..style = PaintingStyle.fill;
    paint.color = color;

    final path = Path()..addPolygon(outerTrianglePoints, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
