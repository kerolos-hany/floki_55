import 'package:floki/layout/home_layout.dart';
import 'package:floki/layout/open_screen.dart';
import 'package:floki/models/filters_model.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/modules/first_screen/first_screen.dart';
import 'package:floki/modules/indoor/indoor_checkout_screen/indoor_checkout_screen.dart';
import 'package:floki/modules/indoor/indoor_menus_screens/mcdonalds_alshorouk_indoor_screen.dart';
import 'package:floki/modules/indoor/indoor_menus_screens/mcdonalds_sheraton_indoor_menu.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_creator.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_error_screen.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_scanner.dart';
import 'package:floki/modules/login_screen/login_screen.dart';
import 'package:floki/modules/outdoor/home_screen/home_screen.dart';
import 'package:floki/modules/outdoor/outdoor_checkout_screen/outdoor_checkout_screen.dart';
import 'package:floki/modules/outdoor/outdoor_menus_screens/mcdonalds_alshorouk_outdoor_screen.dart';
import 'package:floki/modules/outdoor/outdoor_menus_screens/mcdonalds_sheraton_outdoor_menu.dart';
import 'package:floki/modules/pay_by_visa/pay_by_visa.dart';
import 'package:floki/modules/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';

Color secondaryColor = Color(0xfff5cb25);

int screenIndex;
List<Widget> outdoorMenuScreens = [McdonaldsSheratonOutdoorMenu(),McdonaldsAlShoroukOutdoorMenu(),];
List<Widget> indoorMenuScreens = [McdonaldsSheratonIndoorMenu(),McdonaldsAlShoroukIndoorMenu(),];
Map restaurantIndex = {
  "McdonaldsSheraton" : 0,
  "McdonaldsAlShorouk" : 1,
};

List<FilterModel> filters = [
  FilterModel(name: "Sandwiches", image: "Assets/Images/Sandwich.png", id: 0),
  FilterModel(name: "Desserts", image: "Assets/Images/Dessert.png", id: 1),
  FilterModel(name: "Drinks", image: "Assets/Images/Drink.png", id: 2),
];

Map <String,WidgetBuilder> routes = {
  OpenScreen.route : (context) => OpenScreen(),
  LoginScreen.route : (context) => LoginScreen(),
  SignupScreen.route : (context) => SignupScreen(),
  FirstScreen.route : (context) => HomeLayout(screenIndex: 0,),
  QrCodeScanner.route : (context) => QrCodeScanner(),
  QrCodeErrorScreen.route : (context) => HomeLayout(screenIndex: 5,),
  QrCodeCreator.route : (context) => QrCodeCreator(),
  HomeScreen.route : (context) => HomeLayout(screenIndex: 1,),
  McdonaldsSheratonIndoorMenu.route : (context) => HomeLayout(screenIndex: 3,),
  McdonaldsAlShoroukIndoorMenu.route : (context) => HomeLayout(screenIndex: 3,),
  McdonaldsSheratonOutdoorMenu.route : (context) => HomeLayout(screenIndex: 2,),
  McdonaldsAlShoroukOutdoorMenu.route : (context) => HomeLayout(screenIndex: 2,),
  OutdoorCheckOut.route : (context) => HomeLayout(screenIndex: 6,),
  IndoorCheckOut.route : (context) => HomeLayout(screenIndex: 7,),
  PayByVisaScreen.route : (context) => HomeLayout(screenIndex: 8,),
};

// Database
List<MenuItemModel> mcdonaldsMenuItems = [
  MenuItemModel(
    name: "Salad",
    price: 50,
    rate: 4.5,
    type: "Side Dish",
    image: "Assets/Images/Salad.jpg",
    addTag: "Add Salad",
    removeTag: "Remove Salad",
  ),
  MenuItemModel(
    name: "Big Mac",
    price: 150.99,
    rate: 4.0,
    type: "Sandwich",
    itemCount: 0,
    image: "Assets/Images/Big Mac.jpg",
    addTag: "Add Big Mac",
    removeTag: "Remove Big Mac",
  ),
  MenuItemModel(
    name: "Cheese Burger",
    price: 155.99,
    rate: 4.0,
    type: "Sandwich",
    image: "Assets/Images/Cheese Burger.jpg",
    addTag: "Add Cheese burger",
    removeTag: "Remove Cheese burger",
  ),
  MenuItemModel(
    name: "Fries",
    price: 150,
    rate: 4.0,
    type: "Side Dish",
    image: "Assets/Images/Fries.jpg",
    addTag: "Add Fries",
    removeTag: "Remove Fries",
  ),
  MenuItemModel(
    name: "Milk Shake",
    price: 150,
    rate: 4.0,
    type: "Drinks",
    image: "Assets/Images/Milk Shake.jpg",
    addTag: "Add Milk Shake",
    removeTag: "Remove Milk Shake",
  ),
  MenuItemModel(
    name: "Pepsi",
    price: 10,
    rate: 4.0,
    type: "Drinks",
    image: "Assets/Images/Pepsi Can.png",
    addTag: "Add Pepsi",
    removeTag: "Remove Pepsi",
  ),
];
List<String> mcdonaldsBranches = ["Sheraton","AlShorouk","AlNozha","DownTown"];
