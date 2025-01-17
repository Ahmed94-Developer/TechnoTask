import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/usecases/usecase.dart';
import 'package:task/features/orders/domain/entities/order_details_params.dart';
import 'package:task/features/orders/domain/entities/order_details_response.dart';
import 'package:task/features/orders/domain/repositories/orders_repository.dart';

class OrderDetailsUseCase extends UseCase<OrderDetailsResponse,OrderDetailsParams>{
  final OrdersRepository repository;

  OrderDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, OrderDetailsResponse>> call(OrderDetailsParams params) async{
    return await repository.getOrderDetails(params: params);
  }

}