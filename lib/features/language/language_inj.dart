import 'package:get_it/get_it.dart';
import 'package:task/features/language/presentation/cubit/language_cubit.dart';

Future<void>initLangInj(GetIt s)async{
  s.registerFactory(()=>LanguageCubit());
}