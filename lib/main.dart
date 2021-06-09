import 'package:floki_app/screens/open_page.dart';
import 'package:floki_app/screens/signup.dart';
import 'package:floki_app/screens/login.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Floki",
        home: LogInPage()
    );
  }
}

