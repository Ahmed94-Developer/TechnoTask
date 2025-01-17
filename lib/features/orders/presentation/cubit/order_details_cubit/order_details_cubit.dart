import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/orders/domain/entities/order_details_params.dart';
import 'package:task/features/orders/domain/entities/order_details_response.dart';
import 'package:task/features/orders/domain/usecases/order_details_use_case.dart';
import 'package:task/main.dart';

import '../../../../../core/constants/styles/styles.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.orderDetailsUseCase) : super(OrderDetailsInitial());
  bool? orderDetailsLoading = false;
  final OrderDetailsUseCase orderDetailsUseCase;
  OrderDetailsResponse? orderDetailsResponse;

  Future<void>getOrderDetails({required OrderDetailsParams params})async{
    orderDetailsLoading = true;
    emit(OrderDetailsLoadingState());
    try{
      final failOrUser = await orderDetailsUseCase(params);
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          orderDetailsLoading = false;
          msgKey.currentState!.showSnackBar(SnackBar(content: Text(fail.message,
            style: TextStyles.textview14Normal.copyWith(color: white),)));
          emit(OrderDetailsErrorState(message: fail.message));
        }
      }, (response){
        orderDetailsLoading = false;
        orderDetailsResponse = response;
        emit(OrderDetailsSuccessState(orderDetailsResponse: response));
      });
    }on SocketException catch(e){
      orderDetailsLoading = false;
      msgKey.currentState!.showSnackBar(SnackBar(content: Text(e.message,
        style: TextStyles.textview14Normal.copyWith(color: white),)));
      emit(OrderDetailsErrorState(message:e.message));
    }
  }
}
