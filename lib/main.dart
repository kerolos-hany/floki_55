import 'package:flutter/material.dart';
import 'modules/home_screen/homa_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  var secondaryColor = Color(0xfff5cb25);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff170b66),
      ),
      home: HomeScreen(),
    );
  }
}

// Shortcuts:
// Use ctrl+Alt+l to reformat the code
// Use ctrl+d to copy the line that you are standing at
