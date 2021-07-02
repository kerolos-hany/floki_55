import 'package:floki/models/filters_model.dart';
import 'package:floki/modules/menus_screens/outdoor_menus/buffalo_burger_menu_outdoor.dart';
import 'package:floki/modules/menus_screens/indoor_menus/mcdonalds_indoor_menu_screen.dart';
import 'package:flutter/material.dart';

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