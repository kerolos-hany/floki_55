import 'package:floki/layout/home_layout.dart';
import 'package:floki/models/restaurants_model.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  double screenWidth;
  BuildContext context;
  var searchBarController = TextEditingController();
  List<RestaurantsModel> restaurants = [
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png", id: 0),
    RestaurantsModel(imagePath: "Assets/Images/Mcdonalds.png", id: 1),
    RestaurantsModel(imagePath: "Assets/Images/Heart Attack.png", id: 2),
    RestaurantsModel(imagePath: "Assets/Images/Buffalo Burger.png", id: 3),
    RestaurantsModel(imagePath: "Assets/Images/Mcdonalds.png", id: 4),
    RestaurantsModel(imagePath: "Assets/Images/Heart Attack.png", id: 5),
  ];

  @override
  Widget build(BuildContext context) {
    context = this.context;

    return BlocProvider  (
      create: (context) => AppCubit(),
      child: BlocConsumer <AppCubit,AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) => Container(
          color: Colors.white,
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
                      itemBuilder: (context, index) {
                        return _buildRestaurantItem(restaurants[index], context);
                        AppCubit.get(context).emit(RestaurantItemsState());
                        },
                      itemCount: restaurants.length),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(RestaurantsModel restaurant, context) {
    screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        print(restaurant.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeLayout(
              screenIndex: restaurant.id < indoorMenuScreens.length? 2: 4,
              menuScreenIndex: restaurant.id < indoorMenuScreens.length? restaurant.id: 0,
            ),
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
