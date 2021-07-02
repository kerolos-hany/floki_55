import 'package:floki/indoor/qrcode_cubit/qrcode_cubit.dart';
import 'package:floki/indoor/qrcode_cubit/qrcode_states.dart';
import 'package:floki/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class QrCodeCreator extends StatelessWidget {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCodeCubit(),
      child: BlocConsumer<QrCodeCubit, QrCodeCubitStates>(
        listener: (context, state) => {},
        builder: (context, state) => Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              backgroundColor: secondaryColor,
              elevation: 30,
              centerTitle: true,
              title: Text(
                "Qr Code Creator",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            preferredSize: Size.fromHeight(55),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor,width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: QrImage(
                        data: controller.text,
                        size: 200,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    buildTextField(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(context) {
    return BlocConsumer<QrCodeCubit, QrCodeCubitStates>(
        listener: (context, state) => {},
        builder: (context, state) => TextField(
          controller: controller,
          cursorColor: secondaryColor,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            hintText: "Enter data String",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: secondaryColor,width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: secondaryColor,width: 1.5),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.send_outlined),
              color: secondaryColor,
              onPressed: () {
                QrCodeCubit.get(context).emit(QrChangeState());
              },
            ),
          ),
        ),
      );
  }
}
