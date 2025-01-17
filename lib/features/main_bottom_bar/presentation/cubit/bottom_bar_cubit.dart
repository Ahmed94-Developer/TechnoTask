import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/features/home/presentation/screens/home_screen.dart';
import 'package:task/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:task/features/orders/presentation/screens/orders_screen.dart';
import 'package:task/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:task/features/settings/presentation/screens/settings_screen.dart';
import 'package:task/main.dart';

import '../../../../core/constants/images/images.dart';
import '../../../../core/constants/styles/styles.dart';
import '../../../../core/widgets/svg_handler.dart';
import '../../../../injection_container/injection_container.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitial());

  int? currentIndex = EasyLocalization.of(navKey.currentContext!)!.currentLocale!.languageCode == "ar" ? 2 : 0;

  List<Widget>bottomBarWidgets = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> sl<ProfileCubit>()),
        BlocProvider(create: (_)=> sl<OrdersCubit>())
      ], child: const HomeScreen(),
),
    BlocProvider(create: (context) => sl<OrdersCubit>(), child: const OrdersScreen(),
),
    const SettingScreen()
  ];

  final pageController = PageController(initialPage:
  EasyLocalization.of(navKey.currentContext!)!.currentLocale!.languageCode == "ar" ? 2 : 0);

  List<BottomBarItem> bottomBarItems = [
    BottomBarItem(
      inActiveItem: Container(
          alignment: Alignment.center,
          child: customSvg(img: home, width: 30.0, height: 30.0)),
      activeItem: Container(
        alignment: Alignment.center,
          child: customSvg(img: homeBold, width: 30.0, height: 30.0)),
      itemLabel: tr('home')
    ),
    BottomBarItem(
      inActiveItem: Container(
          alignment: Alignment.center,
          child: customSvg(img: orders, width: 30.0, height: 30.0)),
      activeItem: Container(
          alignment: Alignment.center,
          child: customSvg(img: ordersBold, width: 30.0, height: 30.0)),
      itemLabel: tr('orders',)
    ),
    BottomBarItem(
      inActiveItem: Container(
          alignment: Alignment.center,
          child: customSvg(img: element, width: 30.0, height: 30.0)),
      activeItem: Container(
          alignment: Alignment.center,
          child: customSvg(img: elementBold, width: 30.0, height: 30.0)),
      itemLabel: tr('more',)
    ),
  ];
  Future<void>selectIndex({required int ind})async{
    currentIndex = ind;
    emit(UpdateBottomBarState());
  }
}
