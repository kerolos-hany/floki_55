import 'package:floki/layout/home_layout.dart';
import 'package:floki/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../../models/restaurant/restaurants_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  double screenWidth;
  BuildContext context;
  var searchBarController = TextEditingController();
  List<RestaurantsModel> restaurants = [
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png",id: 1),
    RestaurantsModel(
        imagePath:
            "https://logo-logos.com/wp-content/uploads/2017/06/KFC_Logo.png",id: 2),
    RestaurantsModel(
        imagePath:
            "https://assets.cairo360.com/app/uploads/2019/09/59561943_317399918955006_6910051133096460288_n.png",id: 3),
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png",id: 4),
    RestaurantsModel(
        imagePath:
            "https://logo-logos.com/wp-content/uploads/2017/06/KFC_Logo.png",id: 5),
    RestaurantsModel(
        imagePath:
            "https://assets.cairo360.com/app/uploads/2019/09/59561943_317399918955006_6910051133096460288_n.png",id: 6),
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png",id: 7),
    RestaurantsModel(
        imagePath:
            "https://logo-logos.com/wp-content/uploads/2017/06/KFC_Logo.png",id: 8),
    RestaurantsModel(
        imagePath:
            "https://assets.cairo360.com/app/uploads/2019/09/59561943_317399918955006_6910051133096460288_n.png",id: 9),
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
                buildSearchBar(controller: searchBarController),
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
                          _buildRestaurantItem(restaurants[index],context),
                      itemCount: restaurants.length),
                )
              ],
            ),
          ),
        );
  }

  Widget _buildRestaurantItem(restaurant,context) {
    screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        print(restaurant.id);
        if (restaurant.id == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLayout(2),
            ),
          );
        }
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
