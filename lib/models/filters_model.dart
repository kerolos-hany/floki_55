import 'package:flutter/material.dart';

class FilterModel
{
  final String name;
  final String image;
  int id;
  bool tapped;
  Color color;

  FilterModel({this.tapped = false, this.id,@required this.name,@required this.image, this.color});

  static List<FilterModel> filters = [
  FilterModel(name: "Sandwiches", image: "Assets/Images/Sandwich.png", id: 0,),
  FilterModel(name: "Desserts", image: "Assets/Images/Dessert.png", id: 1,),
  FilterModel(name: "Drinks", image: "Assets/Images/Drink.png", id: 2,),
  ];
}
