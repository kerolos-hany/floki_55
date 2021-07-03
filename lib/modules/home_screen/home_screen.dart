import 'package:floki/layout/home_layout.dart';
import 'package:floki/modules/restaurants_screens/buffalo_burger_screen.dart';
import 'package:flutter/material.dart';
import '../../models/restaurant/restaurants_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  double screenWidth;
  BuildContext context;
  var _searchBarController = TextEditingController();
  List<RestaurantsModel> restaurants = [
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png"),
    RestaurantsModel(
        imagePath:
            "https://logo-logos.com/wp-content/uploads/2017/06/KFC_Logo.png"),
    RestaurantsModel(
        imagePath:
            "https://assets.cairo360.com/app/uploads/2019/09/59561943_317399918955006_6910051133096460288_n.png"),
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png"),
    RestaurantsModel(
        imagePath:
            "https://logo-logos.com/wp-content/uploads/2017/06/KFC_Logo.png"),
    RestaurantsModel(
        imagePath:
            "https://assets.cairo360.com/app/uploads/2019/09/59561943_317399918955006_6910051133096460288_n.png"),
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png"),
    RestaurantsModel(
        imagePath:
            "https://logo-logos.com/wp-content/uploads/2017/06/KFC_Logo.png"),
    RestaurantsModel(
        imagePath:
            "https://assets.cairo360.com/app/uploads/2019/09/59561943_317399918955006_6910051133096460288_n.png"),
  ];

  @override
  Widget build(BuildContext context) {
    context = this.context;

    return Container(
          color: Colors.purple[50],
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 350,
                    height: 30,
//                  clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(0, 2)),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 17.5, fontWeight: FontWeight.w400),
                        cursorHeight: 25.0,
                        cursorColor: Colors.yellow,
                        controller: _searchBarController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.yellow[600],
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) =>
                          _buildRestaurantItem(restaurants[index], context),
                      itemCount: restaurants.length),
                )
              ],
            ),
          ),
        );
  }

  Widget _buildRestaurantItem(restaurant, context) {
    screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeLayout(2),
          ),
        );
      },
      child: Container(
        width: (screenWidth - 60) / 2,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1.5, 2),
            ),
          ],
          image: DecorationImage(
              image: restaurant.imagePath.substring(0, 6) == "Assets"
                  ? AssetImage(restaurant.imagePath)
                  : NetworkImage(restaurant.imagePath),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
