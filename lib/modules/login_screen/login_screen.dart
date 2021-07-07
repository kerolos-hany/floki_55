import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/signup_screen/signup_screen.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {

  static String route = "/LoginScreen";
  bool isHidden = true;
  String email, password;
  BuildContext context;
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    this.context = context;
    return BlocConsumer <AppCubit,AppCubitStates> (
      listener: (context,state) {},
      builder: (context,state) {
        return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Images/bck.jpeg'), fit: BoxFit.fill)),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          child: Text("Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ))),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        padding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.popAndPushNamed(context, SignupScreen.route);
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                              color: Color(0xff170b66),
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildEmailRow(),
                  _buildPasswordRow(),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildForgotPasswordBtn(),
                  SizedBox(
                    height: 17,
                  ),
                  _buildLoginBtn(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildSignInWithText(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildSocialBtnRow(),
                ],
              ),
            ),
          ),
        ),
      );
      },
    );
  }

  void toggleVisibility() {
    // setState(() {
    //   isHidden = !isHidden;
    // });
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(3),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          // setState(() {
          //   email = value;
          // });
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
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          // setState(() {
          //   password = value;
          // });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff23195f),
            ),
            // suffixIcon: IconButton(
            //   onPressed: toggleVisibility,
            //   icon: isHidden
            //       ? Icon(Icons.visibility_off)
            //       : Icon(Icons.visibility),
            // ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      // ignore: deprecated_member_use
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
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
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 70),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white)),
        color: Color(0xff170b66),
        onPressed: () {
          Navigator.pushNamed(context, FirstScreen.route);
          },
        child: Text("Log In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            )),
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
              'Assets/Images/face.png',
            ),
          ),
          SizedBox(
            width: 12,
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'Assets/Images/google.png',
            ),
          ),
          SizedBox(
            width: 12,
          ),
          _buildSocialBtn(
                () => print('Login with Twitter'),
            AssetImage(
              'Assets/Images/twitter.png',
            ),
          ),
        ],
      ),
    );
  }
}
