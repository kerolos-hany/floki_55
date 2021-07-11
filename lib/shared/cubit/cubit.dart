import 'package:bloc/bloc.dart';
import 'package:floki/models/filters_model.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/models/restaurants_model.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class AppCubit extends Cubit<AppCubitStates> {

  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<MenuItemModel> filteredListItems = [];

  void filterOnTap(
      {@required context,
      @required FilterModel filter,
      @required RestaurantsModel restaurant}) {
      filter.tapped = !filter.tapped;
      if (filter.tapped == true) {
        filter.color = Colors.white;

        filteredListItems.clear();

        restaurant.items.forEach((element) {
          if(element.type == filter.name)
          {
            if (filteredListItems.isEmpty) {
              filteredListItems.add(element);
              emit(MenuItemState(filteredList: filteredListItems));
            }
            else{
              filteredListItems.add(element);
            }
            emit(MenuItemState(filteredList: filteredListItems));
          }
        });

        FilterModel.filters.forEach((element) {
          if(element.id != filter.id)
            {
              element.tapped = false;
              element.color = Theme.of(context).primaryColor;
            }
        });
        emit(MenuFilterState());
      }
      else
      {
        filter.color = Theme.of(context).primaryColor;
        emit(MenuFilterState());
        filteredListItems.clear();
        emit(MenuItemState(filteredList: filteredListItems));
      }
  }

  void removeItem (MenuItemModel item){
    if (item.itemCount > 0) {
      item.itemCount--;
      emit(MenuRemoveItemState());
    }
  }
  void addItem (MenuItemModel item){
      item.itemCount++;
      emit(MenuAddItemState());
  }

  bool takeAway = false;
  int chairsNumber = 1;
  int tablesNumber = 1;
  Color counterColor = secondaryColor; //Colors.black38;
  Color color = Color(0xff170b66); //Colors.black38;
  Color iconsColor = Color(0xff170b66); //Colors.black38;
  Color iconsBackColor = Colors.white; //Colors.black38;

  void tablesNumberIncrement() {
    if (!takeAway) {
      tablesNumber++;
      emit(TablesNumberState());
    }
    else{}
  }
  void tablesNumberDecrement() {
    if (!takeAway) {
      if (tablesNumber > 0) {
        tablesNumber--;
        emit(TablesNumberState());
      }
    }
    else {}
  }
  void chairsNumberIncrement() {
    if (!takeAway) {
      chairsNumber++;
      emit(ChairsNumberState());
    }
    else {}
  }
  void chairsNumberDecrement() {
    if (!takeAway) {
      if (chairsNumber > 0) {
        chairsNumber--;
        emit(ChairsNumberState());
      }
    }
    else {}
  }

  List <int> tables = [];
  List <int> chairs = [];
  void fillTablesChairsLists () {
    for(int i = 0; i < RestaurantsModel.restaurants.length; i++)
      {
        tables.add(RestaurantsModel.restaurants[i].tables);
        chairs.add(RestaurantsModel.restaurants[i].chairs);
      }
  }
  int orderNumber = 0;

  void resetOrderNumber(){
  Future.delayed(Duration(days: 1), () {
  orderNumber = 0;
  });}
}
