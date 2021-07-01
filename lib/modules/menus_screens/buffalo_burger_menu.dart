import 'package:floki/main.dart';
import 'package:floki/models/filters_model.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';

class BuffaloMenuScreen extends StatefulWidget {
  @override
  _BuffaloMenuScreenState createState() => _BuffaloMenuScreenState();
}

class _BuffaloMenuScreenState extends State<BuffaloMenuScreen> {
  BuildContext context;
  int chairs = 0;
  int tables = 0;
  var searchBarController = TextEditingController();

  List<FilterModel> filters = [
    FilterModel(name: "Sandwiches", image: "Assets/Images/Sandwich.png", id: 0),
    FilterModel(name: "Desserts", image: "Assets/Images/Dessert.png", id: 1),
    FilterModel(name: "Drinks", image: "Assets/Images/Drink.png", id: 2),
  ];

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

  Color filterColor;
  bool tapped = false;
  String chosenBranch = branches[0];

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return SingleChildScrollView(
      child: Container(
        color: Colors.purple[50],
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
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
                          value: chosenBranch,
                          onChanged: (String newValue) {
                            setState(() {
                              chosenBranch = newValue;
                            });
                          },
                          style: TextStyle(
                            color: MyApp().secondaryColor,
                            fontSize: 18.5,
                            fontWeight: FontWeight.w500,
                          ),
                          dropdownColor: Theme.of(context).primaryColor,
                          items: branches
                              .map<DropdownMenuItem<String>>((String value) {
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
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (filters[0].id == 0) {
                            tapped0 = !tapped0;
                            print(filters[0].name);
                            setState(() {
                              if (tapped0 == true) {
                                filterColor0 = Colors.white;
                                tapped1 = tapped2 = false;
                                filterColor1 = filterColor2 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor0 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                          if (filters[0].id == 1) {
                            tapped1 = !tapped1;
                            print(filters[0].name);
                            setState(() {
                              if (tapped1 == true) {
                                filterColor1 = Colors.white;
                                tapped0 = tapped2 = false;
                                filterColor0 = filterColor2 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor1 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                          if (filters[0].id == 2) {
                            tapped2 = !tapped2;
                            print(filters[0].name);
                            setState(() {
                              if (tapped2 == true) {
                                filterColor2 = Colors.white;
                                tapped0 = tapped1 = false;
                                filterColor1 = filterColor0 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor2 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 140.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: filterColor0,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).primaryColor,
                                  offset: Offset(2, 1),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(filters[0].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    filters[0].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: MyApp().secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (filters[1].id == 0) {
                            tapped0 = !tapped0;
                            print(filters[1].name);
                            setState(() {
                              if (tapped0 == true) {
                                filterColor0 = Colors.white;
                                tapped1 = tapped2 = false;
                                filterColor1 = filterColor2 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor0 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                          if (filters[1].id == 1) {
                            tapped1 = !tapped1;
                            print(filters[1].name);
                            setState(() {
                              if (tapped1 == true) {
                                filterColor1 = Colors.white;
                                tapped0 = tapped2 = false;
                                filterColor0 = filterColor2 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor1 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                          if (filters[1].id == 2) {
                            tapped2 = !tapped2;
                            print(filters[1].name);
                            setState(() {
                              if (tapped2 == true) {
                                filterColor2 = Colors.white;
                                tapped0 = tapped1 = false;
                                filterColor1 = filterColor0 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor2 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 140.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: filterColor1,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).primaryColor,
                                  offset: Offset(2, 1),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(filters[1].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    filters[1].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: MyApp().secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (filters[2].id == 0) {
                            tapped0 = !tapped0;
                            print(filters[2].name);
                            setState(() {
                              if (tapped0 == true) {
                                filterColor0 = Colors.white;
                                tapped1 = tapped2 = false;
                                filterColor1 = filterColor2 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor0 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                          if (filters[2].id == 1) {
                            tapped1 = !tapped1;
                            print(filters[2].name);
                            setState(() {
                              if (tapped1 == true) {
                                filterColor1 = Colors.white;
                                tapped0 = tapped2 = false;
                                filterColor0 = filterColor2 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor1 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                          if (filters[2].id == 2) {
                            tapped2 = !tapped2;
                            print(filters[2].name);
                            setState(() {
                              if (tapped2 == true) {
                                filterColor2 = Colors.white;
                                tapped0 = tapped1 = false;
                                filterColor1 = filterColor0 = Theme.of(context).primaryColor;
                              } else //if (filter.id == 0 && tapped == false)
                                  {
                                filterColor2 = Theme.of(context).primaryColor;
                              }
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 140.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: filterColor2,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).primaryColor,
                                  offset: Offset(2, 1),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(filters[2].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    filters[2].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: MyApp().secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _buildMenuItem(items[index]),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                  itemCount: items.length)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(MenuItemModel item) {
    return Container(
      width: (MediaQuery.of(context).size.width) - 40,
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            offset: Offset(1.5, 1.5),
            spreadRadius: 0.5,
            blurRadius: 3,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 3,
                )
              ],
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage(item.image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  width: 210,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        size: 30.0,
                        color: MyApp().secondaryColor,
                      ),
                      Text(
                        "${item.rate}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "${item.price} EGP",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 210,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (item.itemCount > 0) {
                            item.itemCount--;
                          }
                        });
                      },
                      mini: true,
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${item.itemCount}",
                      style: TextStyle(
                        color: MyApp().secondaryColor,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          item.itemCount++;
                        });
                      },
                      mini: true,
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
