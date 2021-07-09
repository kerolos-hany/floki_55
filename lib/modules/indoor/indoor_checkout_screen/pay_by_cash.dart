import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/shared/components/components.dart';
import 'package:flutter/material.dart';

// ignore:must_be_immutable
class PayByCash extends StatelessWidget {

  static String route = "/LoginScreen/HomeScreen/McdonaldsIndoorMenu/McdonaldsIndoorCheckOut/PayByCash";
  List<SelectedItemsModel> selectedItems;
  int orderNumber;
  RestaurantsModel restaurant;

  PayByCash({@required this.selectedItems, @required this.orderNumber, @required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOrderDetails(
            context: context,
            selectedItems: selectedItems,
          ),
          SizedBox(height: 50,),
          Text(
            "Order number:",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30,),
          Text(
            "# $orderNumber",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
