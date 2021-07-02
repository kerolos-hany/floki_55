import 'package:flutter/material.dart';

Widget appBar({@required scaffoldKey})
{
  return PreferredSize(
    child: AppBar(
      elevation: 30,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/AppBarBackground2.jpeg"),
              fit: BoxFit.cover),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(55),
  );
}