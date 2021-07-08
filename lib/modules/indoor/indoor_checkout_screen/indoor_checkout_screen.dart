import 'package:floki/layout/home_layout.dart';
import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class IndoorCheckOut extends StatelessWidget {
  static String route =
      "/LoginScreen/HomeScreen/McdonaldsIndoorMenu/McdonaldsIndoorCheckOut/";
  List<SelectedItemsModel> selectedItems;
  int tables;
  int chairs;
  int orderNumber = 0;
  RestaurantsModel restaurant;

  IndoorCheckOut({@required this.selectedItems, @required this.restaurant});

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          Future.delayed(Duration(days: 1), () {
            orderNumber = 0;
          });
          AppCubit.get(context).fillTablesChairsLists();
          this.context = context;

          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("Assets/Images/bck.jpeg"),
              fit: BoxFit.fill,
            )),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildOrderDetails(
                          selectedItems: selectedItems, context: context),
                      SizedBox(
                        height: 70,
                      ),
                      buildCountersRows(
                          context: context,
                          addTag: "addTables",
                          removeTag: "removeTables",
                          name: "Number of Tables",
                          color: AppCubit.get(context).color,
                          iconsColor: AppCubit.get(context).iconsColor,
                          counterColor: AppCubit.get(context).counterColor,
                          iconsBackColor: AppCubit.get(context).iconsBackColor,
                          onPressMinus: () {
                            AppCubit.get(context).tablesNumberDecrement();
                          },
                          onPressPlus: () {
                            AppCubit.get(context).tablesNumberIncrement();
                          },
                          count: AppCubit.get(context).tablesNumber),
                      SizedBox(
                        height: 20,
                      ),
                      buildCountersRows(
                          context: context,
                          addTag: "addChairs",
                          removeTag: "removeChairs",
                          name: "Number of Chairs",
                          color: AppCubit.get(context).color,
                          iconsColor: AppCubit.get(context).iconsColor,
                          counterColor: AppCubit.get(context).counterColor,
                          iconsBackColor: AppCubit.get(context).iconsBackColor,
                          onPressMinus: () {
                            AppCubit.get(context).chairsNumberDecrement();
                          },
                          onPressPlus: () {
                            AppCubit.get(context).chairsNumberIncrement();
                          },
                          count: AppCubit.get(context).chairsNumber),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Pay By?',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                              context: context,
                              name: "Cash",
                              onPress: _payByCashFunc,
                              width: 130,
                              height: 70,
                              fontSize: 30),
                          SizedBox(
                            width: 50,
                          ),
                          _buildButton(
                              context: context,
                              name: "Visa",
                              onPress: _payByVisaFunc,
                              width: 130,
                              height: 70,
                              fontSize: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildButton({
    context,
    @required String name,
    Function onPress,
    double width = 120,
    double height = 50,
    double fontSize = 25,
  }) {
    return Container(
      width: width,
      height: height,
      // ignore: deprecated_member_use
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Theme.of(context).primaryColor,
          child: Text(name,
              style: TextStyle(
                  fontSize: fontSize,
                  color: secondaryColor,
                  fontWeight: FontWeight.w800)),
          onPressed: () {
            onPress();
          }),
    );
  }

  void _payByVisaFunc() {
    AppCubit.get(context).tables[0] -= AppCubit.get(context).tablesNumber;
    RestaurantsModel.restaurants[0].tables = AppCubit.get(context).tables[0];
    AppCubit.get(context).emit(TablesNumberState());

    AppCubit.get(context).chairs[0] -= AppCubit.get(context).chairsNumber;
    RestaurantsModel.restaurants[0].chairs = AppCubit.get(context).chairs[0];
    AppCubit.get(context).emit(ChairsNumberState());

    orderNumber++;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeLayout(
          screenIndex: 8,
          selectedItems: selectedItems,
          orderNumber: orderNumber,
        ),
      ),
    );
  }

  void _payByCashFunc() {
    AppCubit.get(context).tables[restaurant.id] -=
        AppCubit.get(context).tablesNumber;
    AppCubit.get(context).tablesNumber = 0;
    RestaurantsModel.restaurants[restaurant.id].tables =
        AppCubit.get(context).tables[restaurant.id];
    AppCubit.get(context).emit(TablesNumberState());

    AppCubit.get(context).chairs[restaurant.id] -=
        AppCubit.get(context).chairsNumber;
    AppCubit.get(context).chairsNumber = 0;
    RestaurantsModel.restaurants[restaurant.id].chairs =
        AppCubit.get(context).chairs[restaurant.id];
    AppCubit.get(context).emit(ChairsNumberState());

    orderNumber++;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeLayout(
                  screenIndex: 9,
                  selectedItems: selectedItems,
                  orderNumber: orderNumber,
                )));
  }

  Widget buildCountersRows({
    BuildContext context,
    Function onPressPlus,
    Function onPressMinus,
    @required String name,
    int count = 1,
    Color counterColor,
    Color iconsColor,
    Color color,
    Color iconsBackColor,
    String addTag,
    String removeTag,
  }) {
    return Container(
      width: 350,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "$name: ",
            style: TextStyle(
                fontSize: 24, color: color, fontWeight: FontWeight.w800),
          ),
          FloatingActionButton(
            backgroundColor: iconsBackColor,
            onPressed: onPressMinus,
            heroTag: removeTag,
            child: Icon(
              Icons.remove,
              color: iconsColor,
            ),
            tooltip: 'Decrement',
          ),
          Text('$count',
              style: TextStyle(
                  fontSize: 30,
                  color: counterColor,
                  fontWeight: FontWeight.w800)),
          FloatingActionButton(
            backgroundColor: iconsBackColor,
            onPressed: onPressPlus,
            heroTag: addTag,
            child: Icon(
              Icons.add,
              color: iconsColor,
            ),
            tooltip: 'Increment',
          ),
        ],
      ),
    );
  }
}
