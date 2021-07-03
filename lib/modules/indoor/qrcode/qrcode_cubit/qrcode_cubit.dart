import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'qrcode_states.dart';

class QrCodeCubit extends Cubit<QrCodeCubitStates>{

  QrCodeCubit() : super(QrInitialState());

  static QrCodeCubit get(context) => BlocProvider.of(context);

  void onQrViewCreated(controller)
  {
    emit(QrViewControllerState());
  }
}