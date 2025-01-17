import 'package:get_it/get_it.dart';
import 'package:task/features/profile/data/profile_remote_data_source_impl.dart';
import 'package:task/features/profile/data/profile_repository_impl.dart';
import 'package:task/features/profile/domain/repositories/profile_repository.dart';
import 'package:task/features/profile/domain/usecases/profile_use_case.dart';
import 'package:task/features/profile/presentation/cubit/profile_cubit.dart';

Future<void>initProfileInj(GetIt s)async{
  s.registerFactory(()=> ProfileCubit(s()));
  s.registerLazySingleton(()=> ProfileUseCase(s()));
  s.registerLazySingleton<ProfileRemoteDataSource>(()=> ProfileRemoteDataSourceImpl(s()));
  s.registerLazySingleton<ProfileRepository>(()=> ProfileRepositoryImpl(s()));
}