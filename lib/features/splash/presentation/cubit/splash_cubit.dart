import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/injection_container/injection_container.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  bool? visible = false;
  int currentPage = 0;
  PageController pageController = PageController(
    initialPage: 0,);
  bool? user;
  bool? language;


  Future<void>updateScreen()async{
    Future.delayed(const Duration(milliseconds: 4000), () {
      if(currentPage < 1){
        currentPage++;
      }else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
      visible = true;
      emit(UpdateSplashScreen());
    });
  }
  Future<void>checkAutoLogin()async{
    user = sharedPreferences.getBool('user') ?? false;
    language = sharedPreferences.getBool('lang') ?? false;
  }

}
