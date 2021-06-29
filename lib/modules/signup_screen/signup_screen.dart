import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<SignUp> {
  bool _isHidden = true;
  String email, password, phoneNumber;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/signup.jpeg'), fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 165.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      RaisedButton(
                        padding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.white,
                        onPressed: () {
                          print("please sign up");
                        },
                        child: Text("Log In",
                            style: TextStyle(
                              color: Color(0xff170b66),
                              fontSize: 18,
                            )),
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: Colors.white)),
                          color: Color(0xff170b66),
                          onPressed: () {
                            print("please login");
                          },
                          child: Text("Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildEmailRow(),
                  _buildPasswordRow(),
                  _buildPasswordRowConfirm(),
                  _buildPhoneNumber(),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _buildSignupBtn(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(3),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
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

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff23195f),
            ),
            suffixIcon: IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Widget _buildPasswordRowConfirm() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff23195f),
            ),
            suffixIcon: IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            ),
            labelText: 'Confirm Password',
            labelStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            phoneNumber = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: Color(0xff23195f),
            ),
            labelText: 'Phone Number',
            labelStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 70),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white)),
        color: Color(0xff170b66),
        onPressed: () {
          print("NO terpilih");
        },
        child: Text("Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            )),
      ),
    );
  }
}
