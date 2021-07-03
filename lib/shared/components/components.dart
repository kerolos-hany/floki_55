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

Widget _buildOrderDetailsText({Function onChange}) {
  return Column(
    children: <Widget>[

      Text('Order is:',
        style: TextStyle(color: Color(0xff23195f), fontSize: 30, fontWeight: FontWeight.bold,
        ),),
      SizedBox(height: 30.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //textDirection: TextDirection.ltr,
        children: <Widget>[
          Text('3 Big Mac',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.bold,
            ),
          ),
          //SizedBox(width: 10,),
          Text('150 EGB',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xff23195f),fontSize: 25, fontWeight: FontWeight.w300,
            ),
          ),
        ],),
      SizedBox(height: 30.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //textDirection: TextDirection.ltr,
        children: <Widget>[
          Text('4 Cheesy Burger',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.bold,              ),
          ),
          //SizedBox(width: 8,),
          Text('160 EGB',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xff23195f),fontSize: 25, fontWeight: FontWeight.w300,
            ),
          ),
        ],),
      SizedBox(height: 20.0),
      Text('ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ',
        style: TextStyle(color: Color(0xff23195f), fontSize: 30, fontWeight: FontWeight.w400,
        ),),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //textDirection: TextDirection.ltr,
        children: <Widget>[
          Text('Total Price',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 50,),
          Text('300 EGB',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.w300,
            ),
          ),
        ],),

    ],
  );
}