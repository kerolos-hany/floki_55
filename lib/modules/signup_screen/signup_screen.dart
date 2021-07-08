import 'package:firebase_auth/firebase_auth.dart';
import 'package:floki/models/user_model.dart';
import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/login_screen/login_screen.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  static String route = "/SignupScreen";
  BuildContext context;
  bool isHidden = true;
  bool isHiddenConfirm = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var formKeySignup = GlobalKey<FormState>();
  UserModel newUser;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        this.context = context;
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
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Form(
                    key: formKeySignup,
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
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.route);
                              },
                              child: Text("Log In",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                  )),
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    side: BorderSide(color: Colors.white)),
                                color: Theme.of(context).primaryColor,
                                onPressed: () {},
                                child: Text("Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ))),
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
                            onChange: (value) {
                              newUser.userEmail = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Email must not be empty!";
                              }
                              return null;
                            }),
                        buildTextFormField(
                          context: context,
                          controller: passwordController,
                          labelText: "Password",
                          textInputType: TextInputType.visiblePassword,
                          icon: Icons.lock,
                          onChange: (value) {
                            newUser.userPassword = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password must not be empty!";
                            }
                            return null;
                          },
                          suffixIcon: isHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onPress: () {
                            isHidden = !isHidden;
                            AppCubit.get(context).emit(PasswordState());
                          },
                          obscure: isHidden,
                        ),
                        buildTextFormField(
                          context: context,
                          controller: confirmPasswordController,
                          labelText: "Confirm Password",
                          textInputType: TextInputType.visiblePassword,
                          icon: Icons.lock,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "You must confirm your password!";
                            }
                            return null;
                          },
                          suffixIcon: isHiddenConfirm
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onPress: () {
                            isHiddenConfirm = !isHiddenConfirm;
                            AppCubit.get(context).emit(PasswordState());
                          },
                          obscure: isHiddenConfirm,
                        ),
                        buildTextFormField(
                          controller: phoneNumberController,
                          labelText: "Phone Number",
                          textInputType: TextInputType.phone,
                          context: context,
                          icon: Icons.phone,
                          onChange: (value) {
                            newUser.userPhoneNumber = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Phone Number must not be empty!";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        _buildSignupBtn(),
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

  Widget _buildSignupBtn() {
    return Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 70),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white)),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          userRegister();
        },
        child: Text("Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
    );
  }

  void userRegister() {
    // FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: newUser.userEmail,
    //     password: newUser.userPassword
    // )
    // .then((value) => print(value)).catchError((error){
    //   print(error.toString());
    // });
    if (formKeySignup.currentState.validate()) {
      UserModel.users.add(newUser);
      Navigator.pushReplacementNamed(context, LoginScreen.route);
    }
  }
}
