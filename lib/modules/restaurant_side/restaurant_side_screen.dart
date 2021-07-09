import 'package:floki/models/order_model.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class RestaurantSideScreen extends StatelessWidget {

  static String route = "/LoginScreen/RestaurantSide";
  BuildContext context;

  @override
  Widget build(BuildContext context) {

    this.context = context;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Expanded(
        child: ListView.separated(
          reverse: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildOrderItem(OrderDetailsModel.orders[index]),
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 2,
              color: secondaryColor,
              width: double.infinity,
            );
          },
          itemCount:
          OrderDetailsModel.orders.length,
        ),
      ),
    );
  }

  buildOrderItem(OrderDetailsModel order){
    return ListTile(
      leading: Text(
        order.orderNumber,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
          order.tableNumber,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: (){},
    );
  }
}
