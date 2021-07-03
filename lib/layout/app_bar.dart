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
      leading: IconButton(
        icon: Icon(
          Icons.view_list_rounded,
          color: Color(0xfff5cb25),
          size: 50,
        ),
        onPressed: () {
          scaffoldKey.currentState.openDrawer();
        },
      ),
    ),
    preferredSize: Size.fromHeight(65),
  );
}