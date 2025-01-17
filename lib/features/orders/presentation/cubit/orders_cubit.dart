import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/usecases/usecase.dart';
import 'package:task/features/orders/domain/entities/orders_response.dart';
import 'package:task/features/orders/domain/usecases/completed_order_use_case.dart';
import 'package:task/features/orders/domain/usecases/in_progress_use_case.dart';
import 'package:task/features/orders/domain/usecases/order_details_use_case.dart';
import 'package:task/features/orders/domain/usecases/scheduled_orders_use_case.dart';
import 'package:task/main.dart';

import '../../../../core/constants/styles/styles.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.scheduledOrdersUseCase, this.inProgressUseCase,
      this.completedOrderUseCase) : super(OrdersInitial());

  int? ind =0;
  final ScheduledOrdersUseCase scheduledOrdersUseCase;
  final InProgressUseCase inProgressUseCase;
  final CompletedOrderUseCase completedOrderUseCase;

  bool? orderLoading = false;
  bool? inProgressLoading = false;
  bool? completedOrderLoading = false;
  bool? orderDetailsLoading = false;
  OrdersResponse? ordersResponse;

  Future<void>updateIndex({required int index})async{
    ind = index;
    emit(UpdateTabOrderState());
  }

  Future<void>getScheduledOrders()async{
    orderLoading = true;
    emit(ScheduledOrdersLoadingState());
    try{
      final failOrUser = await scheduledOrdersUseCase(NoParams());
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          orderLoading = false;
          msgKey.currentState!.showSnackBar(SnackBar(content:
          Text(fail.message,style: TextStyles.textview14Normal.copyWith(color: white),)));
          emit(ScheduledOrdersErrorState(message: fail.message));
        }
      }, (success){
        ordersResponse = success;
        orderLoading = false;
        emit(ScheduledOrdersSuccessState(ordersResponse: success));
      });
    }on SocketException catch(e){
      orderLoading = false;
      msgKey.currentState!.showSnackBar(SnackBar(content:
      Text(e.message,style: TextStyles.textview14Normal.copyWith(color: white),)));
      emit(ScheduledOrdersErrorState(message: e.message));
    }
  }

  Future<void>getInProgressOrders()async{
    inProgressLoading = true;
    emit(InProgressOrdersLoadingState());
    try{
      final failOrUser = await inProgressUseCase(NoParams());
      failOrUser.fold((fail){
        if(fail is ServerFailure){
         inProgressLoading = false;
          msgKey.currentState!.showSnackBar(SnackBar(content:
          Text(fail.message,style: TextStyles.textview14Normal.copyWith(color: white),)));
          emit(InProgressOrdersErrorState(message: fail.message));
        }
      }, (success){
        ordersResponse = success;
        inProgressLoading = false;
        emit(InProgressOrdersSuccessState(ordersResponse: success));
      });
    }on SocketException catch(e){
      inProgressLoading = false;
      msgKey.currentState!.showSnackBar(SnackBar(content:
      Text(e.message,style: TextStyles.textview14Normal.copyWith(color: white),)));
      emit(InProgressOrdersErrorState(message: e.message));
    }
  }

  Future<void>getCompletedOrders()async{
    completedOrderLoading = true;
    emit(CompletedOrderLoadingState());
    try{
      final failOrUser = await completedOrderUseCase(NoParams());
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          completedOrderLoading = false;
          msgKey.currentState!.showSnackBar(SnackBar(content:
          Text(fail.message,style: TextStyles.textview14Normal.copyWith(color: white),)));
          emit(CompletedOrderErrorState(message: fail.message));
        }
      }, (success){
        ordersResponse = success;
        completedOrderLoading = false;
        emit(CompletedOrdersSuccessState(ordersResponse: success));
      });
    }on SocketException catch(e){
      completedOrderLoading = false;
      msgKey.currentState!.showSnackBar(SnackBar(content:
      Text(e.message,style: TextStyles.textview14Normal.copyWith(color: white),)));
      emit(CompletedOrderErrorState(message: e.message));
    }
  }
}
