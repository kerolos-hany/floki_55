import 'package:bloc/bloc.dart';
import 'package:floki/layout/home_layout.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_creator.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_scanner.dart';
import 'package:floki/shared/cubit/bloc_observer.dart';
import 'package:flutter/material.dart';

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
        primaryColor: Color(0xff170b66),
      ),
      home: HomeLayout(screenIndex: 0,menuScreenIndex: 0,),
      //0 : FirstPage(), 1 : HomePage(), 2,0 : OutdoorMenusScreens(0), 3,0 IndoorMenuScreens(0)
      //4 :
    );
  }
}
