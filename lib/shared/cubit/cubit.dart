import 'package:bloc/bloc.dart';
import 'package:floki/models/filters_model.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(AppInitialState());

  String chosenBranch = branches[0];
  var chairsNumber = 0;
  var tablesNumber = 0;

  static AppCubit get(context) => BlocProvider.of(context);

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

  void tablesNumberIncrement()
  {
    tablesNumber++;
    emit(TablesNumberState());
  }
  void tablesNumberDecrement()
  {
    if (tablesNumber > 0) {
      tablesNumber--;
      emit(TablesNumberState());
    }
  }
  void chairsNumberIncrement()
  {
    chairsNumber++;
    emit(ChairsNumberState());
  }
  void chairsNumberDecrement()
  {
    if (chairsNumber > 0) {
      chairsNumber--;
      emit(ChairsNumberState());
    }
  }
}
