import 'package:floki/layout/app_bar.dart';
import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/outdoor/home_screen/home_screen.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {

  final int screenIndex;
  final int MenuScreenIndex;

  HomeLayout ({@required this.screenIndex, this.MenuScreenIndex = 0});

  @override
  Widget build(BuildContext context) {

    Map screens = {
      0 : FirstPage(),
      1 : HomeScreen(),
      2 : outdoorMenuScreens[MenuScreenIndex],
      3 : indoorMenuScreens[MenuScreenIndex],
    };

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(scaffoldKey: scaffoldKey),
      body: screens[screenIndex],
    );
  }
}

//  CircleAvatar(
//    child: ClipOval(
//    child: _userImage("Images/image.jpeg"),
//   ),
//  ),
// Widget _userImage(String path) {
//      return Image(
//        image: AssetImage(path),
//        width: 90,
//        height: 90,
//        fit: BoxFit.cover,
//      );
//    }