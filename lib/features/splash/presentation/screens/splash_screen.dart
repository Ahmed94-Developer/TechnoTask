import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/language/presentation/screens/language_screen.dart';
import 'package:task/features/login/presentation/screens/login_screen.dart';
import 'package:task/features/main_bottom_bar/presentation/screens/main_bottom_bar_screen.dart';
import 'package:task/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:task/features/splash/presentation/widgets/splash_widget.dart';

import '../../../../core/constants/images/images.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    context.read<SplashCubit>().checkAutoLogin();
    context.read<SplashCubit>().updateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: BlocBuilder<SplashCubit, SplashState>(
              builder: (context, state) {
                // handle figma Smart Animation using pageView
                return PageView(
                    allowImplicitScrolling: true,
                    clipBehavior: Clip.none,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: context.read<SplashCubit>().pageController,
                  children: [
                    SplashWidget(),

                   (context.read<SplashCubit>().user == true &&
                    context.read<SplashCubit>().language == true)?
                       MainBottomBarScreen() :
                   (context.read<SplashCubit>().user == false &&
                    context.read<SplashCubit>().language == true) ?
                       LoginScreen() :
                   LanguageScreen(type: 'languageSc',)
                  ],
                    );
              },
            ),
      ),
    );
  }

}