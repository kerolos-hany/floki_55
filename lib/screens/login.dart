import 'package:flutter/material.dart';

// print ("kdffgard");
class LogInPage extends StatefulWidget{
  @override
  _loginFormState createState() => _loginFormState();
}
// ignore: camel_case_types
class _loginFormState extends State<LogInPage> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  String email, password;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/signup.jpeg'),
                fit: BoxFit.fill)),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 4, horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: Colors.white)),
                          color: Color(0xff170b66),
                          onPressed: () {
                            print("please login");
                          },
                          child: Text("Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ))
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 4, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.white,
                        onPressed: () {
                          print("please sign up");
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                              color: Color(0xff170b66),
                              fontSize: 18,
                            )
                        ),),
                    ],),
                  SizedBox(height: 15,),
                  _buildEmailRow(),
                  _buildPasswordRow(),
                  SizedBox(height: 7.0,),
                  _buildForgotPasswordBtn(),

                ],

              ),
            ),
            SizedBox(height: 17,),
            _buildLoginBtn(),
            SizedBox(height: 15,),
            _buildSignInWithText(),
            SizedBox(height: 10,),
            _buildSocialBtnRow(),
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
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey[400])),

      ),
    );
  }
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
           style: TextStyle( color: Color(0xff23195f)
        ),),
      ),
    );
  }
  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Color(0xff23195f),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: TextStyle(
            color: Color(0xff23195f),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
  Widget _buildLoginBtn() {
    return Container(
        // ignore: deprecated_member_use
        child: RaisedButton(ع 
         padding: EdgeInsets.symmetric(
          vertical: 12, horizontal: 70),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white)),
           color: Color(0xff170b66),
           onPressed: () {
            print("NO terpilih");
             },
          child: Text("Log In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
          )
      ),

    ),
    );
  }
  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'images/face.png',
            ),
          ),
          SizedBox(width: 12,),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'images/google.png',
            ),
          ),
          SizedBox(width: 12,),
          _buildSocialBtn(
                () => print('Login with Twitter'),
            AssetImage(
              'images/twitter.png',
            ),
          ),
        ],
      ),
    );
  }
}

