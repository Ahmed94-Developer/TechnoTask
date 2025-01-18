import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_router.dart';
import 'core/constants/size_config/size_config.dart';
import "injection_container/injection_container.dart" as di;

GlobalKey<NavigatorState>navKey = GlobalKey();
GlobalKey<ScaffoldMessengerState> msgKey = GlobalKey();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  di.init();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: "assets/translate",
        saveLocale: true,
        fallbackLocale:const Locale("ar"),
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        useFallbackTranslationsForEmptyResources: true,
        startLocale: const Locale('ar'),
        child: MyApp(appRouter:  AppRouter()) ),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MediaQuery.of(context).viewInsets.bottom;
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      navigatorKey: navKey,
      scaffoldMessengerKey: msgKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.onGenerateRoutes,
    );
  }
}


