import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/login/domain/entities/login_response.dart';
import 'package:task/features/login/domain/usecases/login_use_case.dart';
import 'package:task/injection_container/injection_container.dart';
import 'package:task/main.dart';
import '../../../../core/constants/screens/screens.dart';
import '../../../../core/constants/styles/styles.dart';
import '../../../../core/widgets/fluttertoast.dart';
import '../../domain/entities/login_params.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  bool? visible = true;
  final LoginUseCase loginUseCase;
  bool? loading = false;

  FToast fToast = FToast();

  Future<void>setVisibility({required bool visibility})async{
    visible = !visibility;
    emit(UpdateVisibilityState());
  }

  Future<void>setLogin({required LoginParams params})async{
    loading = true;
    emit(LoginLoadingState());
    try{
      final failOrUser = await loginUseCase(params);
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          loading = false;
          msgKey.currentState!.showSnackBar(SnackBar(content: Text(fail.message
            ,style: TextStyles.textview14Normal.copyWith(color: white),)));
          emit(LoginErrorState(message: fail.message));
        }
      }, (response)async{
        loading = false;
       await sharedPreferences.setBool('user', true);
        fToast.showToast(
          child: Container(
            alignment: Alignment.center,
            width: 210,
            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 3,right: 3),
            decoration:   BoxDecoration(color: black.withOpacity(.82),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            child:  Text(response.message!,style: TextStyles.textview14Normal.copyWith(color: white),),
          ),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 4),
        );

        Navigator.of(navKey.currentContext!).pushReplacementNamed(bottomBarSc);
        emit(LoginSuccessState(loginResponse: response));
      });
    }on SocketException catch(e){
      loading = false;
      msgKey.currentState!.showSnackBar(SnackBar(content: Text(e.message!
        ,style: TextStyles.textview14Normal.copyWith(color: white),)));
      emit(LoginErrorState(message: e.message));
    }
  }
  Future<void>checkInternetConnectivity()async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult. ethernet) ||
          connectivityResult.contains(ConnectivityResult.wifi) ) {
        print('connected');
      }
      else {
        fToast.showToast(
          child: Container(
            alignment: Alignment.center,
            width: 210,
            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 7,right: 7),
            decoration:   BoxDecoration(color: black.withOpacity(.82),
              borderRadius: const BorderRadius.all(Radius.circular(12.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.signal_wifi_connected_no_internet_4_sharp,color: white,),
              const SizedBox(width: 5,),
              Text(tr("no_internet"),style: TextStyles.textview14Normal.copyWith(color: white),)
            ],),
          ),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 4),
        );
      }
    }

}
