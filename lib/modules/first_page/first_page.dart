import 'package:flutter/material.dart';
import '../../main.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    Widget _inDoorButton = _buildButton("In door", _inDoorButtonFunc);
    Widget _outDoorButton = _buildButton("Out door", _outDoorButtonFunc);

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
            _inDoorButton,
            _outDoorButton,
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
                    color: MyApp().secondaryColor,
                    fontWeight: FontWeight.w800)),
            onPressed: () {
              onPress();
            }),
      ),
    );
  }

  void _inDoorButtonFunc() {
    print("InDoor");
  }

  void _outDoorButtonFunc() {
    print("OutDoor");
  }
}

//We can use SingleChildScrollView widget to solve the scrolling problem if we faced it
