import 'package:flutter/material.dart';

Widget buildEmailRow({Function onChange}) {
  var emailController = TextEditingController();
  return Padding(
    padding: EdgeInsets.all(3),
    child: TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        emailController.text = value;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xff23195f),
          ),
          labelText: 'E-mail or Username',
          labelStyle: TextStyle(color: Colors.grey[400])),
    ),
  );
}

Widget buildSearchBar({@required controller}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Container(
          width: 350,
          height: 30,
//                  clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(0, 2)),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: TextFormField(
              style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w400),
              cursorHeight: 25.0,
              cursorColor: Colors.yellow,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.yellow[600],
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    ]),
  );
}
