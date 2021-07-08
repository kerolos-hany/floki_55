import 'package:floki/modules/login_screen/login_screen.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OpenScreen extends StatelessWidget {
  static String route = "/";

  @override
  Widget build(BuildContext context) {

    if (initialScreen == "/") {
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        initialScreen = "";
      });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/first.png'),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
}
