import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/constants/screens/screens.dart';
import 'package:task/features/language/presentation/cubit/language_cubit.dart';
import 'package:task/features/language/presentation/screens/language_screen.dart';
import 'package:task/features/login/presentation/cubit/login_cubit.dart';
import 'package:task/features/login/presentation/screens/login_screen.dart';
import 'package:task/features/main_bottom_bar/presentation/cubit/bottom_bar_cubit.dart';
import 'package:task/features/main_bottom_bar/presentation/screens/main_bottom_bar_screen.dart';
import 'package:task/features/orders/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:task/features/profile/presentation/screens/profile_screen.dart';
import 'package:task/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:task/features/orders/presentation/screens/orders_details_screen.dart';
import 'package:task/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:task/features/settings/presentation/screens/about_us_screen.dart';
import 'package:task/features/settings/presentation/screens/contact_us_screen.dart';
import 'package:task/features/settings/presentation/screens/my_reviews_screen.dart';
import 'package:task/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:task/features/settings/presentation/screens/terms_conditions_screen.dart';
import 'package:task/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:task/features/splash/presentation/screens/splash_screen.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'injection_container/injection_container.dart';

class AppRouter{
  Route? onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case splashSc :
        return MaterialPageRoute(builder: (_)=> MultiBlocProvider(providers: [
          BlocProvider(create: (_)=> sl<SplashCubit>(),),
          BlocProvider(create: (_)=> sl<LanguageCubit>(),),
          BlocProvider(create: (_)=> sl<LoginCubit>()),
          BlocProvider(create: (_)=> sl<BottomBarCubit>(),),
        ], child: SplashScreen()));

      case languageSc :
        return MaterialPageRoute(builder: (_)=>
            BlocProvider(create:(_)=> sl<LanguageCubit>(),child: LanguageScreen(type: '',),) );

      case login :
        return MaterialPageRoute(builder: (_)=>
          BlocProvider(create:(_)=> sl<LoginCubit>(),child: LoginScreen(),) );

      case bottomBarSc :
        return MaterialPageRoute(builder: (_)=>
            BlocProvider(create:(_)=> sl<BottomBarCubit>(),child: MainBottomBarScreen(),) );

      case orderDetailsSc :
        return MaterialPageRoute(builder: (_)=>
            BlocProvider(create:(_)=> sl<OrderDetailsCubit>(),child:
            OrdersDetailsScreen(orderId: ModalRoute.of(_)!.settings.arguments as String
              ,),),settings: settings );

      case profileSc :
        return MaterialPageRoute(builder: (_)=>
            BlocProvider(create:(_)=> sl<ProfileCubit>(),child: const ProfileScreen(),) );

      case aboutSc :
        return MaterialPageRoute(builder: (_)=> AboutusScreen(), );

      case contactUs :
        return MaterialPageRoute(builder: (_)=> ContactUsScreen(),);

      case termsSc :
        return MaterialPageRoute(builder: (_)=> TermsConditionsScreen(),);

      case privacySc :
        return MaterialPageRoute(builder: (_)=> const PrivacyScreen(),);

      case myReviewsSc :
        return MaterialPageRoute(builder: (_)=> BlocProvider(create: (_)=> sl<SettingsCubit>()
          ,child: const MyReviewsScreen(),),);

    }
    return null;
  }
}
