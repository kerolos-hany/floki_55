import 'package:floki/models/menu_items_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:flutter/material.dart';

 class RestaurantMenuScreensCreator {

  var searchBarController;
  List<MenuItemModel> items;
  List<SelectedItemsModel> selectedItems;
  List<String> branches;
  String removeTag;
  String addTag;
  int tables;
  int chairs;

  RestaurantMenuScreensCreator({
    @required this.searchBarController,
    @required this.items,
    @required this.branches,
    @required this.tables,
    @required this.chairs,
    @required this.selectedItems,
  });
 }