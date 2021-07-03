import 'package:flutter/material.dart';
import '../../main.dart';

class PayVisa extends StatefulWidget {
  @override
  _PayByVisa createState() => _PayByVisa();
}
class _PayByVisa extends State<PayVisa> {
  bool _isHidden = true;
  String visaNumber, password, validThru;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/Images/bck.jpeg"),
            fit: BoxFit.fill,
          )),
      child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOrderDetailsText(),
                SizedBox(height: 30.0),
                Text('Pay By Visa',
                  style: TextStyle(color: Color(0xff23195f), fontSize: 30, fontWeight: FontWeight.bold,
                  ),),
                SizedBox(height: 20),
              _buildVisaNumberRow(),
              SizedBox(height: 10),
              _buildPasswordRow(),
              SizedBox(height: 10),
              _buildValidThruRow(),
              SizedBox(height: 10),
              _buildSubmitBtn(),
              ],
            ),
          )),
    );
  }
  Widget _buildOrderDetailsText() {
    return Column(
      children: <Widget>[

        Text('Order is:',
          style: TextStyle(color: Color(0xff23195f), fontSize: 30, fontWeight: FontWeight.bold,
          ),),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //textDirection: TextDirection.ltr,
          children: <Widget>[
            Text('3 Big Mac',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.bold,
              ),
            ),
            //SizedBox(width: 10,),
            Text('150 EGB',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(0xff23195f),fontSize: 25, fontWeight: FontWeight.w300,
              ),
            ),
          ],),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //textDirection: TextDirection.ltr,
          children: <Widget>[
            Text('4 Cheesy Burger',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.bold,              ),
            ),
            //SizedBox(width: 8,),
            Text('160 EGB',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(0xff23195f),fontSize: 25, fontWeight: FontWeight.w300,
              ),
            ),
          ],),
        SizedBox(height: 20.0),
        Text('ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ',
          style: TextStyle(color: Color(0xff23195f), fontSize: 30, fontWeight: FontWeight.w400,
          ),),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //textDirection: TextDirection.ltr,
          children: <Widget>[
            Text('Total Price',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 50,),
            Text('300 EGB',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(0xff23195f),fontSize: 27, fontWeight: FontWeight.w300,
              ),
            ),
          ],),

      ],
    );
  }
  Widget _buildVisaNumberRow() {
    return Padding(
      padding: EdgeInsets.only(left: 35.0, right: 35.0, ),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide( color: MyApp().secondaryColor, width: 1.5,),
              borderRadius: BorderRadius.circular(35.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide( color: MyApp().secondaryColor, width: 1.5,),
              borderRadius: BorderRadius.circular(35.0),
            ),
            labelText: 'Visa Number',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    );
  }
  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.only(left: 35.0, right: 35.0, ),
      child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
               borderSide: BorderSide( color: MyApp().secondaryColor, width: 1.5,),
               borderRadius: BorderRadius.circular(35.0),
             ),
            focusedBorder: OutlineInputBorder(
               borderSide: BorderSide( color: MyApp().secondaryColor, width: 1.5,),
               borderRadius: BorderRadius.circular(35.0),),
            labelText: 'Password',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 15,)),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        obscureText: true,

      ),
    );
  }
  Widget _buildValidThruRow() {
    return Padding(
      padding: EdgeInsets.only(left: 35.0, right: 35.0, ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide( color: MyApp().secondaryColor, width: 1.5,),
            borderRadius: BorderRadius.circular(35.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide( color: MyApp().secondaryColor, width: 1.5,),
            borderRadius: BorderRadius.circular(35.0),
          ),
          labelText: 'Valid THRU',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    );
  }
  Widget _buildSubmitBtn() {
    return Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white)),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          print("Submit");
        },
        child: Text("Submit",
            style: TextStyle(
              color: MyApp().secondaryColor,
              fontSize: 19,
            )),
      ),
    );
  }
}
