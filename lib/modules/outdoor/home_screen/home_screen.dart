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

  @override
  Widget build(BuildContext context) {
    context = this.context;

    return BlocProvider  (
      create: (context) => AppCubit(),
      child: BlocConsumer <AppCubit,AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Images/bck.jpeg"),
                fit: BoxFit.fill,
              )),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSearchBar(controller: searchBarController),
                  SizedBox(
                    height: 20.0,
                  ),
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _buildRestaurantItem(RestaurantsModel.restaurants[index], context);
                        AppCubit.get(context).emit(RestaurantItemsState());
                        },
                      itemCount: RestaurantsModel.restaurants.length)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(RestaurantsModel restaurant, context) {

    screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(3),
      child: GestureDetector(
        onTap: () {
          print(restaurant.id);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLayout(
                screenIndex: restaurant.id < indoorMenuScreens.length? 2: 4,
                restaurantName: restaurant.id < indoorMenuScreens.length? restaurant.name: "Mcdonalds",
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
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
      ),
    );
  }
}
