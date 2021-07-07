import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/signup_screen/signup_screen.dart';
import 'package:floki/shared/components/components.dart';
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/Images/bck.jpeg'),
                    fit: BoxFit.fill)),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 580,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                Navigator.popAndPushNamed(
                                    context, SignupScreen.route);
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
                        buildTextFormField(
                          context: context,
                            controller: emailController,
                            labelText: "Email Address",
                            textInputType: TextInputType.emailAddress,
                            icon: Icons.email,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Email must not be empty";
                              }
                              return null;
                            }),
                        buildTextFormField(
                            context: context,
                            controller: passwordController,
                            labelText: "Password",
                            textInputType: TextInputType.visiblePassword,
                            icon: Icons.lock,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            },
                          suffixIcon: isHidden?Icons.visibility_off:Icons.visibility,
                          onPress: (){
                            isHidden = !isHidden;
                            AppCubit.get(context).emit(PasswordState());
                          },
                          obscure: isHidden,
                        ),
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
            ),
          ),
        );
      },
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
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Sign in with',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
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
        color: Theme.of(context).primaryColor,
        onPressed: () {
          if (formKey.currentState.validate()) {
            Navigator.pushNamed(context, FirstScreen.route);
          }
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
        height: 42.5,
        width: 42.5,
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
            width: 20,
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'Assets/Images/google.png',
            ),
          ),
          SizedBox(
            width: 20,
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
