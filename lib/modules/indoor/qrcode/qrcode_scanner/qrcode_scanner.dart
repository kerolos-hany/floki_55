import 'dart:io';
import 'package:floki/layout/home_layout.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  var qrKey = GlobalKey(debugLabel: 'QR');
  String restaurantIndexString;

  Barcode barcode;
  BuildContext context;
  QRViewController qrController;

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

  void _qrCodeRestaurantName(String resultBarCode) {
    int stringLength = resultBarCode.length;
    restaurantIndexString = resultBarCode.substring(2, stringLength);

    if(int.tryParse(restaurantIndexString) == null)
      {
        if (!scanned) {
          scanned = true;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeLayout(screenIndex: 5),
              ),
          ).then((value) {
            scanned = false;
          });
        }
      }
    else if(int.tryParse(restaurantIndexString) != null)
      {
        int index = int.parse(restaurantIndexString);

        if (!scanned) {
          scanned = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLayout(
                screenIndex: index < indoorMenuScreens.length? 3: 4,
                restaurantName: index < indoorMenuScreens.length? restaurantIndex[index] : restaurantIndex[0],
              ),
            ),
          ).then((value) {
            scanned = false;
          });
        }
      }
  }
}
