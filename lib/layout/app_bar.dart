import 'package:flutter/material.dart';

Widget appBar({@required scaffoldKey}) {
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
      actions: [
        GestureDetector(
          onTap: () {print("Avatar");},
          child: CircleAvatar(
            radius: 35,
            child: ClipOval(
              child: Image(
                image: AssetImage("Assets/Images/profile avatar.jpeg"),
              ),
            ),
          ),
        ),
      ],
    ),
    preferredSize: Size.fromHeight(60),
  );
}
