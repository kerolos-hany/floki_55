import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/first.png'),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }
}
