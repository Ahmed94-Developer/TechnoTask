import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/orders/domain/entities/order_details_response.dart';
import 'package:task/features/orders/domain/entities/orders_response.dart';

import '../entities/order_details_params.dart';

abstract class OrdersRepository {
  Future<Either<Failure,OrdersResponse>>getScheduleOrders();
  Future<Either<Failure,OrdersResponse>>getInProgressOrders();
  Future<Either<Failure,OrdersResponse>>getCompletedOrders();
  Future<Either<Failure,OrderDetailsResponse>>getOrderDetails({required OrderDetailsParams params});
}