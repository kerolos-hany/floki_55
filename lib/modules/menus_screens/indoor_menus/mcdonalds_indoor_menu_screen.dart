import 'package:floki/models/menu_items_model.dart';
import 'package:floki/modules/menus_screens/cubit/cubit.dart';
import 'package:floki/modules/menus_screens/cubit/states.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class McdonaldsIndoorMenu extends StatelessWidget {
  var searchBarController = TextEditingController();

  List<MenuItemModel> items = [
    MenuItemModel(
        name: "Big Mac",
        price: 150.99,
        rate: 4.0,
        type: "Sandwich",
        itemCount: 0,
        image: "Assets/Images/Black Jack.jpg"),
    MenuItemModel(
        name: "Cheese burger",
        price: 155.99,
        rate: 4.0,
        type: "Sandwich",
        image: "Image Path"),
    MenuItemModel(
        name: "Fries",
        price: 150,
        rate: 4.0,
        type: "Side Dish",
        image: "Image Path"),
    MenuItemModel(
        name: "Salad",
        price: 150,
        rate: 4.0,
        type: "Side Dish",
        image: "Image Path"),
    MenuItemModel(
        name: "Milk Shake",
        price: 150,
        rate: 4.0,
        type: "Beverages",
        image: "Image Path"),
    MenuItemModel(
        name: "Pepsi",
        price: 10,
        rate: 4.0,
        type: "Beverages",
        image: "Image Path"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: BlocConsumer<MenuCubit,MenuCubitStates>(
        listener: (context,state) {},
        builder: (context, state) => SingleChildScrollView(
            child: Container(
              color: Colors.purple[50],
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  buildSearchBar(controller: searchBarController),
                  Container(
                    height: 110.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: buildFiltersRow(context, filters),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          buildMenuItem(items[index], context),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                      itemCount: items.length)
                ]),
              ),
            )),
      )
    );
  }
}
