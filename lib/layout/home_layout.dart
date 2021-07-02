import 'package:floki/layout/app_bar.dart';
import 'package:floki/modules/first_page/first_screen.dart';
import 'package:floki/outdoor/home_screen/home_screen.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeLayout extends StatefulWidget {

  int index = 0;
  HomeLayout (int index)
  {
    this.index = index;
  }

  @override
  _HomeLayoutState createState() => _HomeLayoutState(index);
}

class _HomeLayoutState extends State<HomeLayout> {

  int index;
  _HomeLayoutState (index)
  {
    this.index = index;
  }
  Map screens = {
    0: FirstPage(),
    1: HomeScreen(),
    2 : outdoorMenuScreens[0],
    3 : indoorMenuScreens[0],
  };

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(scaffoldKey: scaffoldKey),
      body: screens[index],
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