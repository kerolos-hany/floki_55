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
