import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

Widget appBar({@required scaffoldKey, @required context}) {
  return PreferredSize(
    child: AppBar(
      actions: [
        // IconButton(
        //   icon: Icon(
        //     Icons.list_rounded,
        //     color: secondaryColor,
        //   ),
        //   iconSize: 55,
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) => new AlertDialog(
        //         contentTextStyle: TextStyle(
        //             color: secondaryColor,
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold),
        //         backgroundColor:
        //             Theme.of(context).primaryColor.withOpacity(0.9),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30)),
        //         content: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Center(
        //               child: Text(
        //                 "Logged in with UserEmail@gmail.com",
        //                 style: TextStyle(
        //                   color: secondaryColor,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 18,
        //                 ),
        //               ),
        //             ),
        //             SizedBox(height: 20,),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ],
      elevation: 30,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/AppBarBackground2.jpeg"),
              fit: BoxFit.cover),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(55),
  );
}
