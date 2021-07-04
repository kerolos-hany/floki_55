import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PayByVisaScreen extends StatelessWidget {

  String visaNumber, password, validThru;
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/Images/bck.jpeg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildOrderDetailsText(context: context, selectedItems: selectedItems),
                  SizedBox(height: 30.0),
                  Text(
                    'Pay By Visa',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildVisaNumberRow(),
                  SizedBox(height: 10),
                  _buildPasswordRow(),
                  SizedBox(height: 10),
                  _buildValidThruRow(),
                  SizedBox(height: 30),
                  _buildSubmitBtn(),
                ],
              ),
              physics: BouncingScrollPhysics(),
            ),
          )),
    );
  }

  Widget _buildVisaNumberRow() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        labelText: 'Visa Number',
        labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildPasswordRow() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(35.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(35.0),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          )),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: true,
    );
  }

  Widget _buildValidThruRow() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        labelText: 'Valid THRU',
        labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      width: 150,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          print("Submit");
        },
        child: Text(
          "Submit",
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
