import 'package:flutter/material.dart';
import '../../main.dart';

class CheckOutOutDoor extends StatefulWidget {
  @override
  _CheckoutdoorFormState createState() => _CheckoutdoorFormState();
}

class _CheckoutdoorFormState extends State<CheckOutOutDoor> {
//class CheckOut extends StatelessWidget {
  var context;
  int _counter=0;
  int _counter2=0;
  void increment(){setState(() {_counter++;});}
  void decrement(){setState(() {_counter--;});}
  void increment2(){setState(() {_counter2++;});}
  void decrement2(){setState(() {_counter2--;});}

  @override
  Widget build(BuildContext context) {
    this.context = context;
    Widget _takeawayYes = _buildButton1("Yes", _takeawayYesFunc);
    Widget _takeawayNo = _buildButton1("No", _takeawayNoFunc);
    Widget _payByVisa = _buildButton2("Visa", _payByVisaFunc);



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
                Text('Take Away?',
                  style: TextStyle(color: Color(0xff23195f), fontSize: 30, fontWeight: FontWeight.bold,
                  ),),
                SizedBox(width: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _takeawayYes,
                    SizedBox(width: 50,),
                    _takeawayNo,
                  ],),
                SizedBox(height:15,),
                _counterButtonTable(),
                SizedBox(height:10,),
                _counterButtonChairs(),
                SizedBox(height:20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pay By',
                      style: TextStyle(color: Color(0xff23195f), fontSize: 30, fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(width: 40,),
                    _payByVisa,
                  ],),
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
  Widget _buildButton1(String name, onPress()) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 45,
        // ignore: deprecated_member_use
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Theme.of(context).primaryColor,
            child: Text(name,
                style: TextStyle(
                    fontSize: 25,
                    color: MyApp().secondaryColor,
                    fontWeight: FontWeight.w800)),
            onPressed: () {
              onPress();
            }),
      ),
    );
  }
  Widget _counterButtonTable() {

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 300,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Table:",
                style: TextStyle(fontSize: 25,
                    color: Theme.of(context).primaryColor, fontWeight: FontWeight.w800)
            ),
             SizedBox(width: 6.5),
            FloatingActionButton(
              backgroundColor: Colors.white ,
              onPressed: increment,
              child: Icon(Icons.add, color: Color(0xff23195f),),
              tooltip: 'Increment',
            ),
            //SizedBox(width: 5.0),
            Text('$_counter',
                style: TextStyle(fontSize: 25,
                    color: MyApp().secondaryColor, fontWeight: FontWeight.w800)
            ),
            //SizedBox(width: 5.0),
            FloatingActionButton(
              backgroundColor: Colors.white ,
              onPressed: decrement,
              child: Icon(Icons.remove,color: Color(0xff23195f),),
              tooltip: 'Decrement',
            ),
          ],
        ),
      ),
    );
  }
  Widget _counterButtonChairs() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 300,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Chairs:",
                style: TextStyle(fontSize: 25,
                    color: Theme.of(context).primaryColor, fontWeight: FontWeight.w800)
            ),
            // SizedBox(width: 5.0),
            FloatingActionButton(
              backgroundColor: Colors.white ,
              onPressed: increment2,
              child: Icon(Icons.add,color: Color(0xff23195f),),
              tooltip: 'Increment',
            ),
            //SizedBox(width: 5.0),
            Text('$_counter2',
                style: TextStyle(fontSize: 25,
                    color: MyApp().secondaryColor, fontWeight: FontWeight.w800)
            ),
            //SizedBox(width: 5.0),
            FloatingActionButton(
              backgroundColor: Colors.white ,
              onPressed: decrement2,
              child: Icon(Icons.remove,color: Color(0xff23195f),),
              tooltip: 'Decrement',
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildButton2(String name, onPress()) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 130,
        height: 70,
        // ignore: deprecated_member_use
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Theme.of(context).primaryColor,
            child: Text(name,
                style: TextStyle(
                    fontSize: 30,
                    color: MyApp().secondaryColor,
                    fontWeight: FontWeight.w800)),
            onPressed: () {
              onPress();
            }),
      ),
    );
  }

  void _payByVisaFunc() {
    print("Visa");
  }
  void _takeawayNoFunc() {
    print("NO");
  }
  void _takeawayYesFunc() {
    print("YES");
  }

}