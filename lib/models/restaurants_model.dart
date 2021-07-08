import 'package:floki/models/menu_items_model.dart';
import 'package:floki/shared/components/constants.dart';

class RestaurantsModel {
  final String imagePath;
  final String insideImagePath;
  final int id;
  int tables;
  int chairs;
  final String name;
  List<String> branches;
  List<MenuItemModel> items = [];
  final String branchName;

  RestaurantsModel(
      {this.tables,
      this.chairs,
      this.items,
      this.insideImagePath,
      this.branches,
      this.name,
      this.branchName,
      this.imagePath,
      this.id});

  static List<RestaurantsModel> restaurants = [
    RestaurantsModel(
        imagePath: "Assets/Images/Mcdonalds.png",
        branchName: "Sheraton",
        chairs: 80,
        tables: 20,
        id: 0,
        name: "Mcdonalds",
        branches: mcdonaldsBranches,
        items: mcdonaldsSheratonMenuItems),
    RestaurantsModel(
        imagePath: "Assets/Images/Mcdonalds.png",
        branchName: "AlShorouk",
        chairs: 60,
        tables: 15,
        id: 1,
        name: "Mcdonalds",
        branches: mcdonaldsBranches,
        items: mcdonaldsAlShoroukMenuItems),
    RestaurantsModel(
      imagePath: "Assets/Images/Buffalo Burger.png",
      id: 2,
      name: "Buffalo Burger",
      branchName: "Sheraton",
      chairs: 80,
      tables: 20,
    ),
    RestaurantsModel(
      imagePath: "Assets/Images/Buffalo Burger.png",
      id: 3,
      name: "Buffalo Burger",
      branchName: "AlShorouk",
      chairs: 60,
      tables: 15,
    ),
    RestaurantsModel(
      imagePath: "Assets/Images/Heart Attack.png",
      id: 4,
      name: "Heart Attack",
      branchName: "Sheraton",
      chairs: 80,
      tables: 20,
    ),
    RestaurantsModel(
      imagePath: "Assets/Images/Heart Attack.png",
      id: 5,
      name: "Heart Attack",
      branchName: "AlShorouk",
      chairs: 60,
      tables: 15,
    ),
  ];
}
