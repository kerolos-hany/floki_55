import 'package:floki/models/menu_items_model.dart';
import 'package:floki/modules/menu_screens_creators/outdoor_menus_creator/outdoor_menu_screens_design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeartAttackOutdoorMenu extends StatelessWidget {

  var searchBarController = TextEditingController();
  List<MenuItemModel> items = [
    MenuItemModel(
        name: "Salad",
        price: 50,
        rate: 4.5,
        type: "Side Dish",
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
    return OutdoorMenuScreensCreator(
      context: context,
      items: items,
      searchBarController: searchBarController,
    );
  }
}
