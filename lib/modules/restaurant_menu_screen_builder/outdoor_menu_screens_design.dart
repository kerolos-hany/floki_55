import 'package:floki/layout/home_layout.dart';
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
  BuildContext context;
  RestaurantsModel restaurant;

  OutdoorMenuScreensCreator({
    @required this.searchBarController,
    @required this.selectedItems,
    @required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {
        if(state is TablesNumberState)
          {
            restaurant.tables = state.tablesNumber;
          }
        if(state is ChairsNumberState)
        {
          restaurant.chairs = state.chairsNumber;
        }
      },
      builder: (context, state) {

        this.context = context;
        AppCubit.get(context).fillTablesChairsLists();
        if (AppCubit.get(context).chosenBranch == null) {
          AppCubit.get(context).chosenBranch = restaurant.branchName;
          AppCubit.get(context).emit(MenuDropDownState());
        }

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
                    Text(restaurant.name,),
                    buildSearchBar(controller: searchBarController),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Select branch: ",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 200.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: AppCubit.get(context).chosenBranch,
                                onChanged: (String newValue) {
                                  AppCubit.get(context).dropDownOnChange(newValue);
                                  print(AppCubit.get(context).chosenBranch);
                                  Navigator.popAndPushNamed(
                                      context,
                                      "/LoginScreen/HomeScreen/${restaurant.name}${AppCubit.get(context).chosenBranch}OutdoorMenu/"); //MaterialPageRoute(builder: (context) => HomeLayout(screenIndex: 5))
                                },
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                dropdownColor: Theme.of(context).primaryColor,
                                items: restaurant.branches.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                    onTap: () {},
                                  );
                                }).toList(),
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
                      "Available tables: ${AppCubit.get(context).tables[0]} \nAvailable chairs: ${AppCubit.get(context).chairs[0]}",
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
                        itemBuilder: (context, index) => buildMenuItem(
                            item: restaurant.items[index],
                            context: context,
                            addItemTag: restaurant.items[index].addTag,
                            removeItemTag: restaurant.items[index].removeTag),
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
                          selectedItems: selectedItems,),
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
}
