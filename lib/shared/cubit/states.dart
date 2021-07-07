abstract class AppCubitStates {}

class AppInitialState extends AppCubitStates {}
class MenuFilter0State extends AppCubitStates {}
class MenuFilter1State extends AppCubitStates {}
class MenuFilter2State extends AppCubitStates {}
class MenuDropDownState extends AppCubitStates {}
class MenuRemoveItemState extends AppCubitStates {}
class MenuAddItemState extends AppCubitStates {}
class RestaurantItemsState extends AppCubitStates {}
class TablesNumberState extends AppCubitStates {
  int tablesNumber;
  TablesNumberState(this.tablesNumber);
}
class ChairsNumberState extends AppCubitStates {
  int chairsNumber;
  ChairsNumberState(this.chairsNumber);
}
class TakeAwayState extends AppCubitStates {}
class ChangeBranchState extends AppCubitStates {}
class PasswordState extends AppCubitStates {}