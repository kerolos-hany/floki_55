import 'package:flutter/material.dart';

class QrCodeScanner extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }

  _qrCodeTableNumber(String scannedCode) {
    int stringLength = scannedCode.length;
    String tableNumber = scannedCode.substring(0,2);
    return tableNumber;
  }
  _qrCodeRestaurantName(String scannedCode) {
    int stringLength = scannedCode.length;
    String restaurantName = scannedCode.substring(2,stringLength);
    return restaurantName;
  }
}
