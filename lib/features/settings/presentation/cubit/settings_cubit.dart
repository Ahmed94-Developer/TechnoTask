import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/usecases/usecase.dart';
import 'package:task/features/settings/domain/entities/reviews_response.dart';
import 'package:task/features/settings/domain/usecases/reviewes_use_case.dart';
import 'package:task/main.dart';

import '../../../../core/constants/styles/styles.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.reviewsUseCase) : super(SettingsInitial());
  final ReviewsUseCase reviewsUseCase;
   ReviewsResponse? reviewsResponse;
   bool? reviewLoading = false;
   String? msg;
  
  Future<void>getReviews()async{
    reviewLoading = true;
    emit(ReviewsLoadingState());
    try{
      final failOrUser = await reviewsUseCase(NoParams());
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          reviewLoading = false;
          msg = fail.message;
          msgKey.currentState!.showSnackBar(SnackBar(content: Text(fail.message
            ,style: TextStyles.textview14Normal.copyWith(color: white),)));
          emit(ReviewsErrorState(message: fail.message));
        }
      }, (success){
        reviewLoading = false;
        reviewsResponse = success;
       emit(ReviewsSuccessState(response: success));
      });
      
    }on SocketException catch(e){
      reviewLoading = false;
      emit(ReviewsErrorState(message: e.message));
    }
  }
}
