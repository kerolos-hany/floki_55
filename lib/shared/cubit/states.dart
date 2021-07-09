import 'package:flutter/cupertino.dart';

abstract class AppCubitStates {}

class AppInitialState extends AppCubitStates {}
class MenuFilterState extends AppCubitStates {}
class MenuDropDownState extends AppCubitStates {}
class MenuRemoveItemState extends AppCubitStates {}
class MenuAddItemState extends AppCubitStates {}
class RestaurantItemsState extends AppCubitStates {}
class TablesNumberState extends AppCubitStates {
  // int tablesNumber;
  // TablesNumberState(this.tablesNumber);
}
class ChairsNumberState extends AppCubitStates {
  // int chairsNumber;
  // ChairsNumberState(this.chairsNumber);
}
class TakeAwayState extends AppCubitStates {}
class ChangeBranchState extends AppCubitStates {}
class PasswordState extends AppCubitStates {}
class MenuItemState extends AppCubitStates {
  List filteredList;
  MenuItemState({@required this.filteredList});
}