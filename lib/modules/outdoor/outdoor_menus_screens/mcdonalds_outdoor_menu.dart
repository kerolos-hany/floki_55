import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/modules/restaurant_menu_screen_builder/outdoor_menu_screens_design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class McdonaldsOutdoorMenu extends StatelessWidget {

  var searchBarController = TextEditingController();
  List<SelectedItemsModel> selectedItems = [];
  int tables = 0;
  int chairs = 0;

  @override
  Widget build(BuildContext context) {
    return OutdoorMenuScreensCreator(
      selectedItems: selectedItems,
      branches: RestaurantsModel.restaurants[0].branches,
      items: RestaurantsModel.restaurants[0].items,
      searchBarController: searchBarController,
      tables: tables,
      chairs: chairs,
    );
  }
}
