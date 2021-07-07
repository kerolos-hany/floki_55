import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/modules/restaurant_menu_screen_builder/outdoor_menu_screens_design.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class McdonaldsAlShoroukOutdoorMenu extends StatelessWidget {

  static String route = "/LoginScreen/HomeScreen/McdonaldsAlShoroukOutdoorMenu/";
  var searchBarController = TextEditingController();
  List<SelectedItemsModel> selectedItems = [];
  RestaurantsModel restaurant = RestaurantsModel.restaurants[1];
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      onWillPop: onPop,
      child: OutdoorMenuScreensCreator(
        selectedItems: selectedItems,
        searchBarController: searchBarController,
        restaurant: restaurant,
      ),
    );
  }
  Future<bool> onPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Are you sure you want to go back?'),
        content: Text('If your cart has items,it will be cleared!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              for(int i = 0; i < RestaurantsModel.restaurants[1].items.length; i++)
              {
                if (RestaurantsModel.restaurants[1].items[i].itemCount > 0) {
                  RestaurantsModel.restaurants[1].items[i].itemCount = 0;
                }
              }
            },
            child: Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
}
