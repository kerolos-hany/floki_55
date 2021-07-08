import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/modules/restaurant_menu_screen_builder/indoor_menu_screens_design.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class McdonaldsSheratonIndoorMenu extends StatelessWidget {

  String orderTableNumber;
  McdonaldsSheratonIndoorMenu({this.orderTableNumber});

  static String route = "/LoginScreen/HomeScreen/McdonaldsSheratonIndoorMenu/";
  var searchBarController = TextEditingController();
  List<SelectedItemsModel> selectedItems = [];
  RestaurantsModel restaurant = RestaurantsModel.restaurants[1];
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      onWillPop: onPop,
      child: IndoorMenuScreensCreator(
        tableNumber: orderTableNumber,
        searchBarController: searchBarController,
        selectedItems: selectedItems,
        restaurant: restaurant,
      ),
    );
  }
  Future<bool> onPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        contentTextStyle: TextStyle(
          color: secondaryColor,
        ),
        titleTextStyle: TextStyle(
          color: secondaryColor,
        ),
        backgroundColor: Theme
            .of(context)
            .primaryColor
            .withOpacity(.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        title: Text('Are you sure you want to go back?',style: TextStyle(fontWeight: FontWeight.bold),),
        content: Text('If your cart has items,it will be cleared!',style: TextStyle(fontWeight: FontWeight.bold)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No',
              style: TextStyle(
                color: secondaryColor
                ,)
              ,),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              for (int i = 0; i <
                  RestaurantsModel.restaurants[0].items.length; i++) {
                if (RestaurantsModel.restaurants[0].items[i].itemCount > 0) {
                  RestaurantsModel.restaurants[0].items[i].itemCount = 0;
                }
              }
            },
            child: Text('Yes',
              style: TextStyle(
                color: secondaryColor,)
              ,),
          ),
        ],
      ),
    )) ?? false;
  }
}
