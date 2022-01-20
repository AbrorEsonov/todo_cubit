import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_cubit/route/app_route.dart';
import 'package:todo_cubit/utils/colors.dart';
import 'package:todo_cubit/utils/fonts_styles.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: SvgPicture.asset("assets/svg/onboard_notes.svg"),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text(
                  'Reminders made simple',
                  style: Medium.copyWith(fontSize: 22, color: Color(0xff554E8F)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouteName.DASHBOARD);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      OnBoardLightGreen,
                      OnBoardDarkGreen,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: greenShadow,
                      blurRadius: 15.0,
                      spreadRadius: 7.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: Regular.copyWith(color: Color(0xffFCFCFC), fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
