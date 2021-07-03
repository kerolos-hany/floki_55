import 'package:floki/layout/app_bar.dart';
import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_error_screen.dart';
import 'package:floki/modules/outdoor/home_screen/error_not_created_yet_screen.dart';
import 'package:floki/modules/outdoor/home_screen/home_screen.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {

  final int screenIndex;
  final int menuScreenIndex;

  HomeLayout ({@required this.screenIndex, this.menuScreenIndex = 0});

  @override
  Widget build(BuildContext context) {

    Map screens = {
      0 : FirstPage(),
      1 : HomeScreen(),
      2 : outdoorMenuScreens[menuScreenIndex],
      3 : indoorMenuScreens[menuScreenIndex],
      4 : NotCreatedYet(),
      5 : QrCodeErrorScreen(),
    };

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(scaffoldKey: scaffoldKey,context: context),
      body: screens[screenIndex],
    );
  }
}