import 'package:floki/models/filters_model.dart';
import 'package:floki/models/menu_items_model.dart';
import 'package:floki/models/selected_items_model.dart';
import 'package:floki/shared/cubit/cubit.dart';
import 'package:floki/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';

Widget buildEmailRow({Function onChange}) {
  var emailController = TextEditingController();
  return Padding(
    padding: EdgeInsets.all(3),
    child: TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        emailController.text = value;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xff23195f),
          ),
          labelText: 'E-mail or Username',
          labelStyle: TextStyle(color: Colors.grey[400])),
    ),
  );
}

Widget buildSearchBar({@required controller}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Container(
          width: 350,
          height: 30,
//        clipBehavior: Clip.antiAliasWithSaveLayer,
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
              style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w400),
              cursorHeight: 25.0,
              cursorColor: Colors.yellow,
              controller: controller,
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
    ]),
  );
}

Widget buildFiltersRow(context, List<FilterModel> filters) {
  return BlocConsumer<AppCubit,AppCubitStates>(
    listener: (context,state) {},
    builder: (context,state) => Row(
      children: [
        GestureDetector(
          onTap: () {
            AppCubit.get(context).filterOnTap(context, filters[0]);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: AppCubit.get(context).filterColor0,
                boxShadow: [
                  BoxShadow(
                    color: Theme
                        .of(context)
                        .primaryColor,
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
                        color: secondaryColor,
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
            AppCubit.get(context).filterOnTap1(context, filters[1]);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: AppCubit.get(context).filterColor1,
                boxShadow: [
                  BoxShadow(
                    color: Theme
                        .of(context)
                        .primaryColor,
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
                        color: secondaryColor,
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
            AppCubit.get(context).filterOnTap2(context, filters[2]);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: AppCubit.get(context).filterColor2,
                boxShadow: [
                  BoxShadow(
                    color: Theme
                        .of(context)
                        .primaryColor,
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
                        color: secondaryColor,
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
  );
}

Widget buildMenuItem({MenuItemModel item, context, String addItemTag, String removeItemTag}) {
  return Container(
    width: (MediaQuery
        .of(context)
        .size
        .width) - 50,
    height: 120.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Theme
              .of(context)
              .primaryColor,
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
            color: Theme
                .of(context)
                .primaryColor,
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: AssetImage(item.image), fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  item.name,
                  style: TextStyle(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: 210,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Icon(
                    //   Icons.star,
                    //   size: 30.0,
                    //   color: secondaryColor,
                    // ),
                    // Text(
                    //   "${item.rate}",
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(
                    //     color: Theme
                    //         .of(context)
                    //         .primaryColor,
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "${item.price} EGP",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .primaryColor,
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
                  SizedBox(
                    width: 5,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      AppCubit.get(context).removeItem(item);
                    },
                    heroTag: removeItemTag,
                    mini: true,
                    backgroundColor: Colors.white,
                    foregroundColor: Theme
                        .of(context)
                        .primaryColor,
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
                      color: secondaryColor,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      AppCubit.get(context).addItem(item);
                    },
                    heroTag: addItemTag,
                    mini: true,
                    backgroundColor: Colors.white,
                    foregroundColor: Theme
                        .of(context)
                        .primaryColor,
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

Widget buildErrorScreen(String text, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 30,
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Icon(
            Icons.error_outline,
            color: Theme
                .of(context)
                .primaryColor,
            size: 250,
          ),
        ],
      ),
    ),
  );
}

Widget buildOrderDetails({@required context, @required List<SelectedItemsModel> selectedItems}) {

  double total;
  if (selectedItems.length > 0) {
    total = selectedItems[0].price;
  }
  else{
    total = 0;
  }
  for (int i = 1; i < selectedItems.length; i++) {
    total += (selectedItems[i].price * selectedItems[i].count);
    }


  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Order is:',
          style: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30.0),
        Container(
          width: double.infinity,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buildSelectedItemRow(
                  context: context,
                  selectedItem: selectedItems[index]),
              separatorBuilder: (context, index) => SizedBox(height: 20,),
              itemCount: selectedItems.length),
        ),
        SizedBox(height: 30.0),
        Container(
          height: 2,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Total Price',
              style: TextStyle(
                color: Theme
                    .of(context)
                    .primaryColor,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$total EGP",
              style: TextStyle(
                color: Theme
                    .of(context)
                    .primaryColor,
                fontSize: 27,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildSelectedItemRow({@required context, @required SelectedItemsModel selectedItem}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "${selectedItem.count} ${selectedItem.name}",
        style: TextStyle(
          color: Theme
              .of(context)
              .primaryColor,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '${selectedItem.price * selectedItem.count} EGP',
        style: TextStyle(
          color: Theme
              .of(context)
              .primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    ],
  )
  ;
}

