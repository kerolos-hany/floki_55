import 'package:floki/layout/home_layout.dart';
import 'package:floki/modules/indoor/qrcode/qrcode_scanner/qrcode_scanner.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Assets/Images/Background.jpg"),
        fit: BoxFit.fill,
      )),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("In door", _inDoorButtonFunc),
            _buildButton("Out door", _outDoorButtonFunc),
          ],
        ),
      )),
    );
  }

  Widget _buildButton(String name, onPress()) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 40,
        // ignore: deprecated_member_use
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Theme.of(context).primaryColor,
            child: Text(name,
                style: TextStyle(
                    fontSize: 22,
                    color: secondaryColor,
                    fontWeight: FontWeight.w800)),
            onPressed: () {
              onPress();
            }),
      ),
    );
  }

  void _inDoorButtonFunc() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QrCodeScanner(),
      ),
    );
  }

  void _outDoorButtonFunc() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeLayout(screenIndex: 1),
      ),
    );
  }
}

//We can use SingleChildScrollView widget to solve the scrolling problem if we faced it
