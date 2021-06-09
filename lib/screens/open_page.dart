import 'package:flutter/material.dart';

class OpenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/first.png'),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}
