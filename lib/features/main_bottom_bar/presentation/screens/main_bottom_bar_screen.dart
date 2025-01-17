import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/constants/styles/styles.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/main_bottom_bar/presentation/cubit/bottom_bar_cubit.dart';

class MainBottomBarScreen extends StatefulWidget{



  @override
  State<MainBottomBarScreen> createState() => _MainBottomBarScreenState();

}

class _MainBottomBarScreenState extends State<MainBottomBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBody: true,
      body: BlocBuilder<BottomBarCubit, BottomBarState>(
        builder: (context, state) {
          return Container(
            color: bgColor,
            child: PageView(
              controller: context.read<BottomBarCubit>().pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  context.read<BottomBarCubit>().bottomBarWidgets.length, (index) =>
              //Reverse widget list for language changing
              EasyLocalization.of(context)!.currentLocale!.languageCode == "ar" ?
              context.read<BottomBarCubit>().bottomBarWidgets.reversed.toList()[index] :
              context.read<BottomBarCubit>().bottomBarWidgets[index]),
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomBarCubit, BottomBarState>(
        builder: (context, state) {
          return AnimatedNotchBottomBar(
            notchBottomBarController: NotchBottomBarController
              (index: context.read<BottomBarCubit>().currentIndex!),
            color: bottomNavBg,
            showLabel: true,
            textOverflow: TextOverflow.visible,
            maxLine: 1,
            shadowElevation: 2,
            kBottomRadius: 12.0,
            showTopRadius: true,
            showBottomRadius: false,
            bottomBarHeight: 75,
            textAlign: TextAlign.center,
            notchColor: bottomNavBg,
            showShadow: false,
            durationInMilliSeconds: 300,
            itemLabelStyle: TextStyles.textview12Normal.copyWith(color: white),
            elevation: 1,
            //reverse items for changing language to arabic
            bottomBarItems: EasyLocalization.of(context)!.currentLocale!.languageCode == "ar" ?
            context.read<BottomBarCubit>().bottomBarItems.reversed.toList() :
            context.read<BottomBarCubit>().bottomBarItems,
            onTap: (index) {
              context.read<BottomBarCubit>().selectIndex(ind: index);
              context.read<BottomBarCubit>().pageController.jumpToPage(index);
            },
            kIconSize: 24.0,
          );
        },
      ),
    );
  }
}