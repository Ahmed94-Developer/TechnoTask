import 'package:get_it/get_it.dart';
import 'package:task/core/local/auth_local_data_source.dart';
import 'package:task/features/login/data/login_remote_data_source_impl.dart';
import 'package:task/features/login/data/login_repository_impl.dart';
import 'package:task/features/login/domain/repositories/login_repositories.dart';
import 'package:task/features/login/domain/usecases/login_use_case.dart';
import 'package:task/features/login/presentation/cubit/login_cubit.dart';

Future<void>initLoginInj(GetIt s)async{
  s.registerFactory(()=>LoginCubit(s()));
  s.registerLazySingleton<LoginRemoteDataSource>(()=>LoginRemoteDataSourceImpl(s()));
  s.registerLazySingleton<LoginRepositories>(()=>LoginRepositoryImpl(s(), s()));
  s.registerLazySingleton(()=> LoginUseCase(s()));
  s.registerLazySingleton<AuthLocalDataSource>(()=> AuthLocalDataSourceImpl(s()));
}