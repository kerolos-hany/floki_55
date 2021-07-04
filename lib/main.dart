import 'package:bloc/bloc.dart';
import 'package:floki/layout/home_layout.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_creator.dart';
import 'package:floki/shared/cubit/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: HomeLayout(screenIndex: 0, menuScreenIndex: 0,),
      //0 : FirstPage(), 1 : HomeScreen(), 2,0 : outdoorMenuScreens(0), 3,0 indoorMenuScreens(0)
      //4 : NotCreatedYet(), 5 : QrCodeErrorScreen(), 6 : CheckOut(), 7 : PayByVisaScreen()

    );
  }
}
