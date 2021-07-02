import 'package:floki/models/filters_model.dart';
import 'package:floki/modules/menus_screens/outdoor_menus/outdoor_menu_screens_design.dart';
import 'package:floki/modules/menus_screens/indoor_menus/indoor_menu_screens_design.dart';
import 'package:flutter/material.dart';

Color secondaryColor = Color(0xfff5cb25);

List<Widget> outdoorMenuScreens = [BuffaloMenuScreen(),];
List<Widget> indoorMenuScreens = [McdonaldsIndoorMenu(),];

bool tapped0 = false;
bool tapped1 = false;
bool tapped2 = false;
Color filterColor0;
Color filterColor1;
Color filterColor2;

List<String> branches = [
  "Sheraton",
  "Al Shorouk",
  "DownTown",
  "Mohandseen",
];

List<FilterModel> filters = [
  FilterModel(name: "Sandwiches", image: "Assets/Images/Sandwich.png", id: 0),
  FilterModel(name: "Desserts", image: "Assets/Images/Dessert.png", id: 1),
  FilterModel(name: "Drinks", image: "Assets/Images/Drink.png", id: 2),
];

int chairs = 0;
int tables = 0;

String orderTableNumber = "";
String orderRestaurantName = "";
String resultBarCode;
