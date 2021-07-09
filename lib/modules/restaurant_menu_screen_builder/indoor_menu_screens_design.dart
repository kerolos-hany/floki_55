import 'package:floki/layout/home_layout.dart';
import 'package:floki/models/filters_model.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

// ignore: must_be_immutable
class IndoorMenuScreensCreator extends StatelessWidget {
  var searchBarController;
  RestaurantsModel restaurant;
  List<SelectedItemsModel> selectedItems;
  BuildContext context;
  String tableNumber;
  List<MenuItemModel> itemsList;

  IndoorMenuScreensCreator({
    @required this.restaurant,
    @required this.searchBarController,
    @required this.selectedItems,
    @required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    itemsList = restaurant.items;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {
          if (state is MenuItemState) {
            if (FilterModel.filters.any((element) => element.tapped)) {
              itemsList = AppCubit.get(context).filteredListItems;
            } else {
              itemsList = restaurant.items;
            }
          }
        },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("Assets/Images/bck.jpeg"),
                  fit: BoxFit.fill,
                )),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildSearchBar(controller: searchBarController),
                          Container(
                              height: 110.0,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => buildFilter(
                                      context: context,
                                      filter: FilterModel.filters[index],
                                      restaurant: restaurant),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                  itemCount: FilterModel.filters.length)),
                          SizedBox(
                            height: 30.0,
                          ),
                          Conditional.single(
                              context: context,
                              conditionBuilder: (context) {
                                return FilterModel.filters
                                    .any((element) => element.tapped == false);
                              },
                              widgetBuilder: (context) {
                                return ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Center(
                                        child: buildMenuItem(
                                            item: itemsList[index],
                                            context: context,
                                            addItemTag: itemsList[index].addTag,
                                            removeItemTag:
                                                itemsList[index].removeTag)),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                    itemCount: itemsList.length);
                                // cubit.emit(MenuItemState(filteredList: ));
                              },
                              fallbackBuilder: (context) {
                                return ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Center(
                                          child: buildMenuItem(
                                              item: itemsList[index],
                                              context: context,
                                              addItemTag:
                                                  itemsList[index].addTag,
                                              removeItemTag:
                                                  itemsList[index].removeTag),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                    itemCount: itemsList.length);
                                // cubit.emit(MenuFilterState());
                              }),
                          SizedBox(
                            height: 70.0,
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 150,
                  height: 35,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: secondaryColor,
                    onPressed: () {
                      if (selectedItems.isEmpty) {
                        for (int i = 0; i < restaurant.items.length; i++) {
                          if (restaurant.items[i].itemCount > 0) {
                            selectedItems.add(SelectedItemsModel(
                                name: restaurant.items[i].name,
                                count: restaurant.items[i].itemCount,
                                price: restaurant.items[i].price));
                          }
                        }
                      } else {
                        selectedItems.clear();
                        for (int i = 0; i < restaurant.items.length; i++) {
                          if (restaurant.items[i].itemCount > 0) {
                            selectedItems.add(SelectedItemsModel(
                                name: restaurant.items[i].name,
                                count: restaurant.items[i].itemCount,
                                price: restaurant.items[i].price));
                          }
                        }
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeLayout(
                            screenIndex: 7,
                            selectedItems: selectedItems,
                            restaurant: restaurant,
                          ),
                        ),
                      );
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
