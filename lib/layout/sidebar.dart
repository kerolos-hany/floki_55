import 'package:floki/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideBar extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String UserName = "Omar Shebl";
  // ignore: non_constant_identifier_names
  String UserEmail = "Omarshebl36@outlook.com";

  @override
  Widget build(BuildContext context) {
    //var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            //color: Theme.of(context).primaryColor
            gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor,Colors.purple[700]],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
          child: ListView(
            children: [
             /* UserAccountsDrawerHeader(
                accountName: Text(
                  UserName,
                  style: TextStyle(color: MyApp().secondaryColor),
                ),
                accountEmail: Text(
                  UserEmail,
                  style: TextStyle(color: MyApp().secondaryColor),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: _userImage("Images/image.jpeg"),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(
                    bottom: BorderSide(
                     color: MyApp().secondaryColor,
                    )),
                    color: Theme.of(context).primaryColor),
              ),*/
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: MyApp().secondaryColor,
                ),
                title: Text(
                  "Home Page",
                  style: TextStyle(color: MyApp().secondaryColor),
                ),
                onTap: () {
                  print("Restaurants");
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.local_dining,
                  color: MyApp().secondaryColor,
                ),
                title: Text(
                  "Your Orders",
                  style: TextStyle(color: MyApp().secondaryColor),
                ),
                onTap: () => print("Orders"),
              ),
            ],
          ),
        ),
        elevation: 20,
      ),
    );
  }

  // Widget _userImage(String path) {
  //   return Image(
  //     image: AssetImage(path),
  //     width: 90,
  //     height: 90,
  //     fit: BoxFit.cover,
  //   );
  // }
}
