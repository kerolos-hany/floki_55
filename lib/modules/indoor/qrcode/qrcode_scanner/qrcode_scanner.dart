import 'dart:io';
import 'package:floki/models/restaurants_model.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_error_screen.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  static String route = "/LoginScreen/QrCodeScanner/";

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  var qrKey = GlobalKey(debugLabel: 'QR');

  Barcode barcode;
  BuildContext context;
  QRViewController qrController;
  String branchIndexString;
  int branchIndex;
  String restaurantName;
  int chosenRestaurantIndex;
  RestaurantsModel chosenRestaurant;
  String chosenBranch;
  String resultBarCode;
  String orderTableNumber;

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await qrController.pauseCamera();
    }
    qrController.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return buildQrScanner(context);
  }

  bool scanned = false;

  Widget buildQrScanner(context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: (controller) {
        setState(() {
          qrController = controller;
        });
        qrController.scannedDataStream.listen((barcode) {
          this.barcode = barcode;
          resultBarCode = barcode.code;
          print(resultBarCode);
          _qrCodeTableNumber(resultBarCode);
          _qrCodeBranchName(resultBarCode);
          _qrCodeRestaurantName(resultBarCode);
        });
      },
      overlay: QrScannerOverlayShape(
        borderLength: 50,
        borderRadius: 30,
        borderWidth: 15,
        borderColor: secondaryColor,
        cutOutSize: MediaQuery.of(context).size.width * 0.85,
      ),
    );
  }

  void _qrCodeTableNumber(String resultBarCode) {
    orderTableNumber = resultBarCode.substring(0, 2);
  }
  void _qrCodeBranchName(String resultBarCode)
  {
    branchIndexString = resultBarCode.substring(2, 4);
    try {
      branchIndex = int.parse(branchIndexString);
    } on Exception catch (e) {
      scanned = true;
      print("Error $e found");
      Navigator.pushNamed(context, QrCodeErrorScreen.route).then((value) {
        scanned = false;
      });
    }
  }

  void _qrCodeRestaurantName(String resultBarCode) {
    int stringLength = resultBarCode.length;
    restaurantName = resultBarCode.substring(4, stringLength);

    try {
      chosenRestaurantIndex = RestaurantsModel.restaurants
          .indexWhere((element) => element.name == restaurantName);
    } on Exception catch (e) {
      scanned = true;
      print("Error $e caught!");
      Navigator.pushNamed(context, QrCodeErrorScreen.route).then((value) {
        scanned = false;
      });
    }

    chosenRestaurant = RestaurantsModel.restaurants[chosenRestaurantIndex];
    chosenBranch = chosenRestaurant.branches[branchIndex];

    if (!scanned) {
      scanned = true;
      Navigator.pushNamed(context,
              "/LoginScreen/HomeScreen/${chosenRestaurant.name}${chosenBranch}IndoorMenu/",arguments: orderTableNumber)
          .then((value) {
        scanned = false;
      });
    }
  }
}
