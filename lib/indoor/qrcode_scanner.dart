import 'dart:io';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  var qrKey = GlobalKey(debugLabel: 'QR');

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
          // print(orderTableNumber);
          // print(orderRestaurantName);
        });
      },
      overlay: QrScannerOverlayShape(
        borderLength: 20,
        borderRadius: 10,
        borderWidth: 10,
        borderColor: secondaryColor,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void _qrCodeTableNumber(String resultBarCode) {
    orderTableNumber = resultBarCode.substring(0, 2);
    }

  void _qrCodeRestaurantName(String resultBarCode) {
    int stringLength = resultBarCode.length;
    orderRestaurantName = resultBarCode.substring(2, stringLength);
  }
}
