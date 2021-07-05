import 'package:floki/models/menu_items_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/modules/restaurant_menu_screen_builder/indoor_menu_screens_design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class McdonaldsIndoorMenu extends StatelessWidget {

  var searchBarController = TextEditingController();

  List<MenuItemModel> items = [
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

  List<SelectedItemsModel> selectedItems = [];
  int chairs = 0;
  int tables = 0;

  @override
  Widget build(BuildContext context) {
    return IndoorMenuScreensCreator(
      items: items,
      searchBarController: searchBarController,
      chairs: chairs,
      tables: tables,
      selectedItems: selectedItems,
    );
  }
}
