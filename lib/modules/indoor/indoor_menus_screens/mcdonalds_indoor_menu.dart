import 'package:floki/models/menu_items_model.dart';
import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/modules/restaurant_menu_screen_builder/indoor_menu_screens_design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class McdonaldsIndoorMenu extends StatelessWidget {

  var searchBarController = TextEditingController();
  List<SelectedItemsModel> selectedItems = [];
  int chairs = RestaurantsModel.restaurants[0].chairs;
  int tables = RestaurantsModel.restaurants[0].tables;

  @override
  Widget build(BuildContext context) {
    return IndoorMenuScreensCreator(
      items: RestaurantsModel.restaurants[0].items,
      searchBarController: searchBarController,
      chairs: chairs,
      tables: tables,
      selectedItems: selectedItems,
    );
  }
}
