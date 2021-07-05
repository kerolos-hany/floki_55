import 'package:floki/layout/app_bar.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/indoor/indoor_checkout_screen/indoor_checkout_screen.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_error_screen.dart';
import 'package:floki/modules/outdoor/home_screen/error_not_created_yet_screen.dart';
import 'package:floki/modules/outdoor/home_screen/home_screen.dart';
import 'package:floki/modules/outdoor/outdoor_checkout_screen/outdoor_checkout_screen.dart';
import 'package:floki/modules/pay_by_visa/pay_by_visa.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {

  int screenIndex;
  String restaurantName;
  int tables;
  int chairs;
  List<SelectedItemsModel> selectedItems;

  HomeLayout ({@required this.screenIndex, this.restaurantName = "Mcdonalds", this.selectedItems, this.tables, this.chairs});

  @override
  Widget build(BuildContext context) {

    Map screens = {
      0 : FirstScreen(),
      1 : HomeScreen(),
      2 : outdoorMenuScreens[restaurantIndex[restaurantName]],
      3 : indoorMenuScreens[restaurantIndex[restaurantName]],
      4 : NotCreatedYet(),
      5 : QrCodeErrorScreen(),
      6 : OutdoorCheckOut(selectedItems: selectedItems),
      7 : IndoorCheckOut(selectedItems: selectedItems),
      8 : PayByVisaScreen(selectedItems: selectedItems),
    };

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(scaffoldKey: scaffoldKey,context: context),
      body: screens[screenIndex],
    );
  }
}