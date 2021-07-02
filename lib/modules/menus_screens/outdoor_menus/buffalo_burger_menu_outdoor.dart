import 'package:floki/main.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/modules/menus_screens/cubit/cubit.dart';
import 'package:floki/modules/menus_screens/cubit/states.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BuffaloMenuScreen extends StatelessWidget {
  BuildContext context;
  int chairs = 0;
  int tables = 0;
  var searchBarController = TextEditingController();

  List<MenuItemModel> items = [
    MenuItemModel(
        name: "Big Mac",
        price: 150.99,
        rate: 4.0,
        type: "Sandwich",
        itemCount: 0,
        image: "Assets/Images/Black Jack.jpg"),
    MenuItemModel(
        name: "Cheese burger",
        price: 155.99,
        rate: 4.0,
        type: "Sandwich",
        image: "Image Path"),
    MenuItemModel(
        name: "Fries",
        price: 150,
        rate: 4.0,
        type: "Side Dish",
        image: "Image Path"),
    MenuItemModel(
        name: "Salad",
        price: 150,
        rate: 4.0,
        type: "Side Dish",
        image: "Image Path"),
    MenuItemModel(
        name: "Milk Shake",
        price: 150,
        rate: 4.0,
        type: "Beverages",
        image: "Image Path"),
    MenuItemModel(
        name: "Pepsi",
        price: 10,
        rate: 4.0,
        type: "Beverages",
        image: "Image Path"),
  ];

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return BlocProvider(
        create: (context) => MenuCubit(),
        child: BlocConsumer<MenuCubit, MenuCubitStates>(
          listener: (context, state) {},
          builder: (context, state) => SingleChildScrollView(
            child: Container(
              color: Colors.purple[50],
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildSearchBar(controller: searchBarController),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Select branch: ",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 200.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: MenuCubit.get(context).chosenBranch,
                                onChanged: (String newValue) {
                                  MenuCubit.get(context).chosenBranch = newValue;
                                  MenuCubit.get(context).emit(MenuDropDownState());
                                },
                                style: TextStyle(
                                  color: MyApp().secondaryColor,
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                dropdownColor: Theme.of(context).primaryColor,
                                items: branches.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Available tables: $tables \nAvailable chairs: $chairs",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 110.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: buildFiltersRow(context,filters),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            buildMenuItem(items[index],context),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20.0,
                            ),
                        itemCount: items.length)
                  ],
                ),
              ),
            ),
          ),
        ));
  }


// SingleChildScrollView(
//       child: Container(
//         color: Colors.purple[50],
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               buildSearchBar(controller: searchBarController),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 50.0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Select branch: ",
//                       style: TextStyle(
//                         color: Theme.of(context).primaryColor,
//                         fontSize: 22.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Container(
//                       width: 200.0,
//                       height: 50.0,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor,
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                       child: Center(
//                         child: DropdownButton<String>(
//                           value: chosenBranch,
//                           onChanged: (String newValue) {
//                             setState(() {
//                               chosenBranch = newValue;
//                             });
//                           },
//                           style: TextStyle(
//                             color: MyApp().secondaryColor,
//                             fontSize: 18.5,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           dropdownColor: Theme.of(context).primaryColor,
//                           items: branches
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 15.0,
//               ),
//               Text(
//                 "Available tables: $tables \nAvailable chairs: $chairs",
//                 style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 height: 110.0,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: buildFiltersRow(context),
//                 ),
//               ),
//               SizedBox(
//                 height: 60.0,
//               ),
//               ListView.separated(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) => _buildMenuItem(items[index]),
//                   separatorBuilder: (context, index) => SizedBox(
//                         height: 20.0,
//                       ),
//                   itemCount: items.length)
//             ],
//           ),
//         ),
//       ),
//     )
// Widget _buildFilter(FilterModel filter, context) {
//   return GestureDetector(
//     onTap: () {
//       tapped = !tapped;
//       print(filter.name);
//       setState(() {
//         if (tapped == true) {
//           filterColor = Colors.white;
//         } else //if (filter.id == 0 && tapped == false)
//         {
//           filterColor = Theme.of(context).primaryColor;
//         }
//       });
//     },
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//         width: 140.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(35.0),
//           color:
//               filter.id == 0 ? filterColor : Theme.of(context).primaryColor,
//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(context).primaryColor,
//               offset: Offset(2, 1),
//               spreadRadius: 0.5,
//               blurRadius: 2,
//             )
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 60,
//                 height: 55,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(filter.image),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 filter.name,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: MyApp().secondaryColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

}
