import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/signup_screen/signup_screen.dart';
import 'package:floki/shared/catch_helper.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {

  static String route = "/LoginScreen";
  String email, password = "";
  bool isHidden = true;
  BuildContext context;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates> (
      listener: (context, state) {
        if(state is LoginSuccessState)
        {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uId,
          );
          Navigator.pushReplacementNamed(context, FirstScreen.route);
        }
        if(state is LoginErrorState)
          {
            showDialog(context: context, builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              content: Text(AppCubit.get(context).loginError),
              contentTextStyle: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              backgroundColor: Theme.of(context)
                  .primaryColor
                  .withOpacity(.9),
            ),
            );
          }
      },
      builder: (context, state) {
        this.context = context;
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/Images/bck.jpeg'),
                    fit: BoxFit.cover)),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
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
                                        fontSize: 20,
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
                                  Navigator.pushReplacementNamed(
                                      context, SignupScreen.route);
                                },
                                child: Text("Sign Up",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
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
                              onChange: (value) {
                              email = value;
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
                                email = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Password must not be empty!";
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
                            height: 35,
                          ),
                          _buildLoginBtn(),
                        ],
                      ),
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
            AppCubit.get(context).userLogin(email: emailController.text,password: passwordController.text);
          }
        },
        child: Text("Log In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
    );
  }
  // Widget _buildLoginWithText() {
  //   return Column(
  //     children: <Widget>[
  //       Text(
  //         '- OR -',
  //         style: TextStyle(
  //           color: Theme.of(context).primaryColor,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //       SizedBox(height: 10.0),
  //       Text(
  //         'Login with',
  //         style: TextStyle(
  //           color: Theme.of(context).primaryColor,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       height: 42.5,
  //       width: 42.5,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: Offset(0, 2),
  //             blurRadius: 6.0,
  //           ),
  //         ],
  //         image: DecorationImage(
  //           image: logo,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildSocialBtnRow() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 20.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         _buildSocialBtn(
  //           () => print('Login with Facebook'),
  //           AssetImage(
  //             'Assets/Images/face.png',
  //           ),
  //         ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //         _buildSocialBtn(
  //           () => print('Login with Google'),
  //           AssetImage(
  //             'Assets/Images/google.png',
  //           ),
  //         ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //         _buildSocialBtn(
  //           () => print('Login with Twitter'),
  //           AssetImage(
  //             'Assets/Images/twitter.png',
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
