import 'package:bloc/bloc.dart';
import 'package:floki/indoor/qrcode_cubit/qrcode_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeCubit extends Cubit<QrCodeCubitStates>{

  QrCodeCubit() : super(QrInitialState());

  static QrCodeCubit get(context) => BlocProvider.of(context);

  void onQrViewCreated(controller)
  {
    emit(QrViewControllerState());
  }
}