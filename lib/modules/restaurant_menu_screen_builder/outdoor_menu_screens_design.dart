import 'package:floki/layout/home_layout.dart';
import 'package:floki/models/filters_model.dart';
import 'package:floki/models/restaurants_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OutdoorMenuScreensCreator extends StatelessWidget {
  var searchBarController;
  List<SelectedItemsModel> selectedItems;
  RestaurantsModel restaurant;

  OutdoorMenuScreensCreator({
    @required this.searchBarController,
    @required this.selectedItems,
    @required this.restaurant,
  });

  BuildContext context;
  var selectedBranch;

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).fillTablesChairsLists();
    selectedBranch = restaurant.branchName;

    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        this.context = context;
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("Assets/Images/bck.jpeg"),
                fit: BoxFit.cover,
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
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Select branch: ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Container(
                              width: 130.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        restaurant.branchName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_circle_outlined,
                                        color: secondaryColor,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          "Branches: ",
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        contentTextStyle: TextStyle(
                                          color: secondaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        content: Container(
                                          width: double.minPositive,
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                buildBranchList(restaurant,
                                                    restaurant.branches[index]),
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return Container(
                                                height: 2,
                                                color: secondaryColor,
                                                width: double.infinity,
                                              );
                                            },
                                            itemCount:
                                                restaurant.branches.length,
                                          ),
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.9),
                                      ),
                                    );
                                  },
                                  textColor: secondaryColor,
                                  padding: EdgeInsets.all(3.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Available tables: ${restaurant.tables} \nAvailable chairs: ${restaurant.chairs}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 110.0,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return buildFilter(
                                  context: context,
                                  filter: FilterModel.filters[index]);
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 5.0,
                                ),
                            itemCount: FilterModel.filters.length),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Center(
                            child: buildMenuItem(
                                item: restaurant.items[index],
                                context: context,
                                addItemTag: restaurant.items[index].addTag,
                                removeItemTag: restaurant.items[index].removeTag),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20.0,
                              ),
                          itemCount: restaurant.items.length),
                      SizedBox(
                        height: 70.0,
                      ),
                    ],
                  ),
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
                          screenIndex: 6,
                          restaurant: restaurant,
                          restaurantName: restaurant.name,
                          branchName: restaurant.branchName,
                          selectedItems: selectedItems,
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
    );
  }

  Widget buildBranchList(RestaurantsModel restaurantsModel, String branch) {
    return Container(
      width: 200.0,
      child: TextButton(
        onPressed: () {
          if (restaurantsModel.branchName != branch) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeLayout(
                  screenIndex: 2,
                  restaurantName: restaurantsModel.name,
                  branchName: branch,
                ),
              ),
            );
          }
        },
        child: Text(
          "$branch",
          style: TextStyle(
            color: secondaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
