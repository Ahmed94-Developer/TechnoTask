import 'package:get_it/get_it.dart';
import 'package:task/features/main_bottom_bar/presentation/cubit/bottom_bar_cubit.dart';

Future<void>initBottomBarInj(GetIt s)async{
  s.registerFactory(()=> BottomBarCubit());
}