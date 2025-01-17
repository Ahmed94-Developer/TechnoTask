import 'package:get_it/get_it.dart';
import 'package:task/features/settings/data/settings_remote_data_source_impl.dart';
import 'package:task/features/settings/data/settings_repository_impl.dart';
import 'package:task/features/settings/domain/repositories/settings_repository.dart';
import 'package:task/features/settings/domain/usecases/reviewes_use_case.dart';
import 'package:task/features/settings/presentation/cubit/settings_cubit.dart';

Future<void>iniSettingsInj(GetIt s)async{
  s.registerFactory(()=> SettingsCubit(s()));
  s.registerLazySingleton<SettingsRemoteDataSource>(()=>SettingsRemoteDataSourceImpl(s()));
  s.registerLazySingleton<SettingsRepository>(()=>SettingsRepositoryImpl(s()));
  s.registerLazySingleton(()=>ReviewsUseCase(s()));
}