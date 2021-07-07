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

  String chosenBranch;
  bool tapped0 = false;
  bool tapped1 = false;
  bool tapped2 = false;
  Color filterColor0;
  Color filterColor1;
  Color filterColor2;

  void filterOnTap(context, FilterModel filter) {
    if (filter.id == 0) {
      tapped0 = !tapped0;
      print(filter.name);
      if (tapped0 == true) {
        filterColor0 = Colors.white;
        tapped1 = tapped2 = false;
        filterColor1 = filterColor2 = Theme.of(context).primaryColor;
        emit(MenuFilter0State());
      } else //if (filter.id == 0 && tapped == false)
      {
        filterColor0 = Theme.of(context).primaryColor;
        emit(MenuFilter0State());
      }
    }
  }

  void filterOnTap1(context, FilterModel filter) {
    if (filter.id == 1) {
      tapped1 = !tapped1;
      print(filter.name);
      if (tapped1 == true) {
        filterColor1 = Colors.white;
        tapped0 = tapped2 = false;
        filterColor0 = filterColor2 = Theme.of(context).primaryColor;
        emit(MenuFilter1State());
      } else //if (filter.id == 0 && tapped == false)
      {
        filterColor1 = Theme.of(context).primaryColor;
        emit(MenuFilter1State());
      }
    }
  }

  void filterOnTap2(context, FilterModel filter) {
    if (filter.id == 2) {
      tapped2 = !tapped2;
      print(filter.name);
      if (tapped2 == true) {
        filterColor2 = Colors.white;
        tapped0 = tapped1 = false;
        filterColor1 = filterColor0 = Theme.of(context).primaryColor;
        emit(MenuFilter2State());
      } else //if (filter.id == 0 && tapped == false)
      {
        filterColor2 = Theme.of(context).primaryColor;
        emit(MenuFilter2State());
      }
    }
  }

  String dropDownOnChange(String newValue) {
    return chosenBranch = newValue;
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
  int chairsNumber = 0;
  int tablesNumber = 0;
  Widget tableCounterRow;
  Color counterColor = secondaryColor; //Colors.black38;
  Color color = Color(0xff170b66); //Colors.black38;
  Color iconsColor = Color(0xff170b66); //Colors.black38;
  Color iconsBackColor = Colors.white; //Colors.black38;

  void tablesNumberIncrement() {
    if (!takeAway) {
      tablesNumber++;
      emit(TablesNumberState(tables[0]));
    }
    else{}
  }
  void tablesNumberDecrement() {
    if (!takeAway) {
      if (tablesNumber > 0) {
        tablesNumber--;
        emit(TablesNumberState(tables[0]));
      }
    }
    else {}
  }
  void chairsNumberIncrement() {
    if (!takeAway) {
      chairsNumber++;
      emit(ChairsNumberState(chairs[0]));
    }
    else {}
  }
  void chairsNumberDecrement() {
    if (!takeAway) {
      if (chairsNumber > 0) {
        chairsNumber--;
        emit(ChairsNumberState(chairs[0]));
      }
    }
    else {}
  }

  List <int> tables = [];
  List <int> chairs = [];
  void fillTablesChairsLists ()
  {
    for(int i = 0; i < RestaurantsModel.restaurants.length; i++)
      {
        tables.add(RestaurantsModel.restaurants[i].tables);
        chairs.add(RestaurantsModel.restaurants[i].chairs);
      }
  }
}
