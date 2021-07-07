import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
  static String route = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, FirstScreen.route);
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Images/first.png'),
                  fit: BoxFit.fill
              )
          ),
        ),
      ),
    );
  }
}
