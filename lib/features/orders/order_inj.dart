import 'package:get_it/get_it.dart';
import 'package:task/features/orders/data/orders_remote_data_source_impl.dart';
import 'package:task/features/orders/data/orders_repository_impl.dart';
import 'package:task/features/orders/domain/repositories/orders_repository.dart';
import 'package:task/features/orders/domain/usecases/completed_order_use_case.dart';
import 'package:task/features/orders/domain/usecases/in_progress_use_case.dart';
import 'package:task/features/orders/domain/usecases/order_details_use_case.dart';
import 'package:task/features/orders/domain/usecases/scheduled_orders_use_case.dart';
import 'package:task/features/orders/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:task/features/orders/presentation/cubit/orders_cubit.dart';

Future<void>initOrderInj(GetIt s)async{
  s.registerFactory(()=> OrdersCubit(s(),s(),s()));
  s.registerFactory(()=> OrderDetailsCubit(s()));
  s.registerLazySingleton(()=>OrderDetailsUseCase(s()));
  s.registerLazySingleton(()=> ScheduledOrdersUseCase(s()));
  s.registerLazySingleton(()=> CompletedOrderUseCase(s()));
  s.registerLazySingleton(()=> InProgressUseCase(s()));
  s.registerLazySingleton<OrdersRemoteDataSource>(()=> OrdersRemoteDataSourceImpl(s()));
  s.registerLazySingleton<OrdersRepository>(()=> OrdersRepositoryImpl(s()));
}