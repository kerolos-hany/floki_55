import 'package:floki/shared/components/components.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotCreatedYet extends StatelessWidget {

  String text = "The restaurant's menu screen is not created yet!";
  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(text, context);
  }
}