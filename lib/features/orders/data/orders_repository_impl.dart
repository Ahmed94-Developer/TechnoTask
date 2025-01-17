import 'package:dartz/dartz.dart';
import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/features/orders/data/orders_remote_data_source_impl.dart';
import 'package:task/features/orders/domain/entities/order_details_params.dart';
import 'package:task/features/orders/domain/entities/order_details_response.dart';
import 'package:task/features/orders/domain/entities/orders_response.dart';
import 'package:task/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource ordersRemoteDataSource;

  OrdersRepositoryImpl(this.ordersRemoteDataSource);

  @override
  Future<Either<Failure, OrdersResponse>> getScheduleOrders() async{
    try{
      final response = await ordersRemoteDataSource.getScheduledOrders();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.toString()));
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }
  }

  @override
  Future<Either<Failure, OrdersResponse>> getInProgressOrders() async{
    try{
      final response = await ordersRemoteDataSource.getInProgressOrders();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.toString()));
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }
  }

  @override
  Future<Either<Failure, OrdersResponse>> getCompletedOrders() async{
    try{
      final response = await ordersRemoteDataSource.getCompletedOrders();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.toString()));
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }
  }

  @override
  Future<Either<Failure, OrderDetailsResponse>> getOrderDetails({required OrderDetailsParams params}) async{
    try{
      final response = await ordersRemoteDataSource.getOrderDetails(params: params);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }
  }

}