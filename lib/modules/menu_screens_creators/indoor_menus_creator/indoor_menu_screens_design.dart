import 'package:floki/layout/home_layout.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/components/components.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class IndoorMenuScreensCreator extends StatelessWidget {
  var searchBarController;
  List<MenuItemModel> items;
  BuildContext context;

  IndoorMenuScreensCreator({
    @required this.items,
    @required this.searchBarController,
    @required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildSearchBar(controller: searchBarController),
                        Container(
                          height: 110.0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: buildFiltersRow(context, filters),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                buildMenuItem(items[index], context),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20.0,
                                ),
                            itemCount: items.length),
                        SizedBox(
                          height: 70.0,
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: 150,
                height: 35,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: secondaryColor,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLayout(screenIndex: 7),),);
                  },
                  textColor: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
