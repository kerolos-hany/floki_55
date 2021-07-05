import 'package:floki/layout/home_layout.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OutdoorCheckOut extends StatelessWidget {
  List<SelectedItemsModel> selectedItems;
  int tables;
  int chairs;

  OutdoorCheckOut(
      {@required this.selectedItems,
      @required this.tables,
      @required this.chairs});

  BuildContext context;
  String takeAwayStatus = "Indoor";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                      SizedBox(height: 40.0),
                      Text(
                        'Take Away?',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                              context: context,
                              name: "Yes",
                              onPress: _takeAwayYesFunc),
                          SizedBox(width: 50,),
                          _buildButton(
                              context: context,
                              name: "No",
                              onPress: _takeAwayNoFunc),
                        ],
                      ),
                      SizedBox(height: 30,),
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
                      SizedBox(height: 20,),
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
                      SizedBox(height: 70,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                              context: context,
                              name: "Go to Payment",
                              onPress: _payByVisaFunc,
                              width: 250,
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
    print("Visa");

    if (AppCubit.get(context).takeAway) {
      takeAwayStatus = "Takeaway";
    } else {
      takeAwayStatus = "Indoor";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeLayout(
          screenIndex: 8,
          selectedItems: selectedItems,
        ),
      ),
    );
  }

  void _takeAwayNoFunc() {
    AppCubit.get(context).takeAway = false;
    takeAwayStatus = "Indoor";
    AppCubit.get(context).counterColor = secondaryColor;
    AppCubit.get(context).color = Color(0xff170b66);
    AppCubit.get(context).iconsColor = Color(0xff170b66);
    AppCubit.get(context).iconsBackColor = Colors.white;
    AppCubit.get(context).emit(TakeAwayState());
  }

  void _takeAwayYesFunc() {
    AppCubit.get(context).takeAway = true;
    takeAwayStatus = "Takeaway";
    AppCubit.get(context).counterColor = Colors.grey;
    AppCubit.get(context).color = Colors.grey;
    AppCubit.get(context).iconsColor = Colors.black;
    AppCubit.get(context).iconsBackColor = Colors.grey;
    AppCubit.get(context).tablesNumber = 0;
    AppCubit.get(context).chairsNumber = 0;
    AppCubit.get(context).emit(TakeAwayState());
  }

  Widget buildCountersRows({
    BuildContext context,
    Function onPressPlus,
    Function onPressMinus,
    @required String name,
    int count,
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
