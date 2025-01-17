import 'package:task/core/constants/errors/exceptions.dart';
import 'package:task/core/utils/api_bas_helper.dart';
import 'package:task/features/orders/domain/entities/order_details_response.dart';
import 'package:task/features/orders/domain/entities/orders_response.dart';

import '../domain/entities/order_details_params.dart';

const ordersApi = "/orders/user-orders";
const orderDetailsApi = "/orders/";

abstract class OrdersRemoteDataSource {
  Future<OrdersResponse>getScheduledOrders();
  Future<OrdersResponse>getInProgressOrders();
  Future<OrdersResponse>getCompletedOrders();
  Future<OrderDetailsResponse>getOrderDetails({required OrderDetailsParams params});
}
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiBaseHelper helper;

  OrdersRemoteDataSourceImpl(this.helper);

  @override
  Future<OrdersResponse> getScheduledOrders() async{
    try{
      Map<String,dynamic> queryParams = {
        'status' : 'scheduled'
      };
      final response = await helper.get(url: ordersApi,query: queryParams);
      return OrdersResponse.fromJson(response);
    }on ServerException catch(e){
      throw ServerException(message: e.message);
    }on UnAuthorizedException catch(e){
      throw UnAuthorizedAppException(e.message);
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }
  }

  @override
  Future<OrdersResponse> getInProgressOrders() async{
   try{
     Map<String,dynamic> queryParams = {
       'status' : 'in_progress'
     };
     final response = await helper.get(url: ordersApi,query: queryParams);
     return OrdersResponse.fromJson(response);
   }on ServerException catch(e){
     throw ServerException(message: e.message);
   }on UnAuthorizedException catch(e){
     throw UnAuthorizedException(message: e.message);
   }on NotFoundException catch(e){
     throw NotFoundException(message: e.message);
   }
  }

  @override
  Future<OrdersResponse> getCompletedOrders() async{
    try{
      Map<String,dynamic> queryParams = {
        'status' : 'done'
      };
      final response = await helper.get(url: ordersApi,query: queryParams);
      return OrdersResponse.fromJson(response);
    }on ServerException catch(e){
      throw ServerException(message: e.message);
    }on UnAuthorizedException catch(e){
      throw UnAuthorizedException(message: e.message);
    }on NotFoundException catch(e){
      throw NotFoundException(message: e.message);
    }
  }

  @override
  Future<OrderDetailsResponse> getOrderDetails({required OrderDetailsParams params}) async {
    try {
      final response = await helper.get(url: orderDetailsApi + params.orderId!);
      return OrderDetailsResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on NotFoundException catch (e) {
      throw NotFoundException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedAppException(e.message);
    }
  }
}