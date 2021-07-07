import 'package:floki/models/selected_items_model.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PayByVisaScreen extends StatelessWidget {

  static String route = "/LoginScreen/HomeScreen/McdonaldsOutdoorMenu/McdonaldsOutdoorCheckOut/PayByVisa";
  List<SelectedItemsModel> selectedItems;
  PayByVisaScreen({@required this.selectedItems});

  String visaNumber, password, validThru;
  BuildContext context;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) {
        this.context = context;
        return AppCubit();
      },
      child: BlocConsumer<AppCubit,AppCubitStates>(
        listener: (context, state){},
        builder: (context, state) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Images/bck.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildOrderDetails(context: context, selectedItems: selectedItems),
                      SizedBox(height: 30.0),
                      Text(
                        'Pay By Visa',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildVisaNumberRow(),
                      SizedBox(height: 10),
                      _buildPasswordRow(),
                      SizedBox(height: 10),
                      _buildValidThruRow(),
                      SizedBox(height: 30),
                      _buildSubmitBtn(),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildVisaNumberRow() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        labelText: 'Visa Number',
        labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildPasswordRow() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(35.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(35.0),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          )),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: true,
    );
  }

  Widget _buildValidThruRow() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        labelText: 'Valid THRU',
        labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      width: 150,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          print("Submit");
        },
        child: Text(
          "Submit",
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
