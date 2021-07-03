import 'package:floki/models/menu_items_model.dart';
import 'package:floki/modules/menu_screens_creators/indoor_menus_creator/indoor_menu_screens_design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuffaloIndoorMenu extends StatelessWidget {
  var searchBarController = TextEditingController();

  List<MenuItemModel> items = [
    MenuItemModel(
        name: "7 UP",
        price: 10,
        rate: 4.0,
        type: "Drinks",
        image: "Image Path"),
    MenuItemModel(
        name: "Big Mac",
        price: 150.99,
        rate: 4.0,
        type: "Sandwich",
        itemCount: 0,
        image: "Assets/Images/Black Jack.jpg"),
    MenuItemModel(
        name: "Cheese burger",
        price: 155.99,
        rate: 4.0,
        type: "Sandwich",
        image: "Image Path"),
    MenuItemModel(
        name: "Fries",
        price: 150,
        rate: 4.0,
        type: "Side Dish",
        image: "Image Path"),
    MenuItemModel(
        name: "Salad",
        price: 150,
        rate: 4.0,
        type: "Side Dish",
        image: "Image Path"),
    MenuItemModel(
        name: "Milk Shake",
        price: 150,
        rate: 4.0,
        type: "Beverages",
        image: "Image Path"),
    MenuItemModel(
        name: "Pepsi",
        price: 10,
        rate: 4.0,
        type: "Beverages",
        image: "Image Path"),
  ];

  @override
  Widget build(BuildContext context) {
    return IndoorMenuScreensCreator(
      items: items,
      searchBarController: searchBarController,
      context: context,
    );
  }
}
