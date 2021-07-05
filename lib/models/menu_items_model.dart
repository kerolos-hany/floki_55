import 'package:flutter/material.dart';

class MenuItemModel {
  final String name;
  final String image;
  final String type;
  final double price;
  final double rate;
  final String removeTag;
  final String addTag;
  int itemCount;

  MenuItemModel(
      {@required this.name,
      @required this.image,
      @required this.type,
      @required this.price,
      @required this.rate,
      @required this.removeTag,
      @required this.addTag,
      this.itemCount = 0});
}
