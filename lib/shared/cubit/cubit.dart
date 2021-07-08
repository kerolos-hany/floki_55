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

  void filterOnTap(context, FilterModel filter) {
      filter.tapped = !filter.tapped;
      if (filter.tapped == true) {
        filter.color = Colors.white;

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
      }
  }

  void removeItem (MenuItemModel item){
    if (item.itemCount > 0) {
      item.itemCount--;
      print(item.itemCount);
      emit(MenuRemoveItemState());
    }
  }

  void addItem (MenuItemModel item){
      item.itemCount++;
      print(item.itemCount);
      emit(MenuAddItemState());
  }

  bool takeAway = false;
  int chairsNumber = 1;
  int tablesNumber = 1;
  Widget tableCounterRow;
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

}
