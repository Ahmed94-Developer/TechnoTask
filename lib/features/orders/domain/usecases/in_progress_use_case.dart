import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/usecases/usecase.dart';
import 'package:task/features/orders/domain/entities/orders_response.dart';
import 'package:task/features/orders/domain/repositories/orders_repository.dart';

class InProgressUseCase extends UseCase<OrdersResponse,NoParams>{
  final OrdersRepository ordersRepository;

  InProgressUseCase(this.ordersRepository);

  @override
  Future<Either<Failure, OrdersResponse>> call(NoParams params) async{
    return await ordersRepository.getInProgressOrders();
  }

}