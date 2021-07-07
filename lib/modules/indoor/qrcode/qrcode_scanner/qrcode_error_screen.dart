import 'package:floki/shared/components/components.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QrCodeErrorScreen extends StatelessWidget {

  static String route = "/LoginScreen/QrCodeScanner/QrCodeErrorScreen";
  String text = "Invalid Input! Please, scan a valid Qr code.";
  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(text, context);
  }
}