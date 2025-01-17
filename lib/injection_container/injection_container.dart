import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/utils/api_bas_helper.dart';
import 'package:task/features/language/language_inj.dart';
import 'package:task/features/login/login_inj.dart';
import 'package:task/features/main_bottom_bar/bottom_bar_inj.dart';
import 'package:task/features/orders/order_inj.dart';
import 'package:task/features/profile/profile_inj.dart';
import 'package:task/features/settings/settings_inj.dart';
import 'package:task/features/splash/splash_inj.dart';

late final SharedPreferences sharedPreferences;
final sl = GetIt.instance;
 final helper = ApiBaseHelper();

Future<void>init()async{
 sharedPreferences = await SharedPreferences.getInstance();
 helper.dioInit();

 sl.registerLazySingleton(() => sharedPreferences);
 sl.registerLazySingleton(() => helper);

 await initSplashInj(sl);
 await initLoginInj(sl);
 await initLangInj(sl);
 await initBottomBarInj(sl);
 await initOrderInj(sl);
 await initProfileInj(sl);
 await iniSettingsInj(sl);
 }