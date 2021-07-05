import 'package:floki/models/filters_model.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/modules/indoor/indoor_menus_screens/mcdonalds_indoor_menu.dart';
import 'package:floki/modules/outdoor/outdoor_menus_screens/mcdonalds_outdoor_menu.dart';
import 'package:flutter/material.dart';

Color secondaryColor = Color(0xfff5cb25);

List<Widget> outdoorMenuScreens = [McdonaldsOutdoorMenu(),];
List<Widget> indoorMenuScreens = [McdonaldsIndoorMenu(),];

int screenIndex;


List<FilterModel> filters = [
  FilterModel(name: "Sandwiches", image: "Assets/Images/Sandwich.png", id: 0),
  FilterModel(name: "Desserts", image: "Assets/Images/Dessert.png", id: 1),
  FilterModel(name: "Drinks", image: "Assets/Images/Drink.png", id: 2),
];

String orderTableNumber = "";
String resultBarCode;

Map restaurantIndex = {
  "Mcdonalds" : 0,
};
Map branchIndex = {
  "" : 0,
};

List<String> mcdonaldsBranches = ["Sheraton","Al Shorouk","Al Nozha","Down Town"];

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