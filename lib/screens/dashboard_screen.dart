
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_path_drawer/common/color_constants.dart';
import 'package:flutter_custom_path_drawer/widgets/circle_card_widget.dart';
import 'package:flutter_custom_path_drawer/widgets/logo_widget.dart';


class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  String amount = "3467,87";

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Hero(
          tag: 'Logo',
          child: LogoWidget(
            logoTxt: "LOGO",
            fontSize: 30,
            height: 30,
            width: 30,
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu,
            size: 30,
            color: primaryColor,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/logout.png",
                  height: 25,
                  width: 25,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "\$" + amount,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 45,
                            color: Color(0XFF3B928D),
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Text(
                    "Account Balance",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 16,
                          color: Color(0XFF3B928D),
                        ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.white,
                child: GridView.count(
                  padding: EdgeInsets.all(21.0),
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: <Widget>[
                    CircleCardWidget(
                      iconImg: "assets/profile.png",
                      nameTxt: "My Profile",
                      delayStart: Duration(milliseconds: 250),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/fundstrasfer.png",
                      nameTxt: "Fund Transfer",
                      delayStart: Duration(milliseconds: 350),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/money.png",
                      nameTxt: "Payment",
                      delayStart: Duration(milliseconds: 450),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/transcation.png",
                      nameTxt: "Transaction\nReport",
                      delayStart: Duration(milliseconds: 150),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/register.png",
                      nameTxt: "Register",
                      delayStart: Duration(milliseconds: 250),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/top.png",
                      nameTxt: "Top Up",
                      delayStart: Duration(milliseconds: 350),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/other.png",
                      nameTxt: "Other",
                      delayStart: Duration(milliseconds: 50),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/search.png",
                      nameTxt: "Search",
                      delayStart: Duration(milliseconds: 150),
                    ),
                    CircleCardWidget(
                      iconImg: "assets/setting.png",
                      nameTxt: "Settings",
                      delayStart: Duration(milliseconds: 250),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
