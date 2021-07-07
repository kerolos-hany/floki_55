import 'package:bloc/bloc.dart';
import 'package:floki/layout/home_layout.dart';
import 'package:floki/layout/open_screen.dart';
import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_creator.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_scanner.dart';
import 'package:floki/modules/login_screen/login_screen.dart';
import 'modules/signup_screen/signup_screen.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/bloc_observer.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black38,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          primaryColor: Color(0xff170b66),
        ),
        initialRoute: LoginScreen.route,
        routes: routes,
      ),
    );
  }
}
