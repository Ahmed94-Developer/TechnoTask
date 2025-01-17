import 'package:get_it/get_it.dart';
import 'package:task/features/splash/presentation/cubit/splash_cubit.dart';

Future<void>initSplashInj(GetIt s)async{
  s.registerFactory(()=>SplashCubit());
}