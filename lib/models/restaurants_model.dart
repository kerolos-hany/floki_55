import 'package:floki/models/menu_items_model.dart';
import 'package:floki/shared/components/constants.dart';

class RestaurantsModel
{
  final String imagePath;
  final String insideImagePath;
  final int id;
  final String name;
  List<String> branches = ["Main"];
  List<MenuItemModel> items = [];

  RestaurantsModel({this.items, this.insideImagePath, this.branches, this.name, this.imagePath , this.id});

  static List<RestaurantsModel> restaurants = [
    RestaurantsModel(imagePath: "Assets/Images/Mcdonalds.png", id: 0,name: "Mcdonalds",branches: mcdonaldsBranches,items: mcdonaldsMenuItems),
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png", id: 1,name: "Buffalo Burger"),
    RestaurantsModel(imagePath: "Assets/Images/Heart Attack.png", id: 2, name: "Heart Attack"),
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png", id: 3),
    RestaurantsModel(imagePath: "Assets/Images/Mcdonalds.png", id: 4),
    RestaurantsModel(imagePath: "Assets/Images/Heart Attack.png", id: 5),
  ];
}