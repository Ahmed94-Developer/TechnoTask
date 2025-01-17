import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/errors/failure.dart';
import 'package:task/core/usecases/usecase.dart';
import 'package:task/features/profile/domain/entities/profile_response.dart';
import 'package:task/features/profile/domain/usecases/profile_use_case.dart';
import 'package:task/main.dart';

import '../../../../core/constants/styles/styles.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileUseCase) : super(ProfileInitial());
  final ProfileUseCase profileUseCase;
  bool? loading = false;
  ProfileResponse? profileResponse;

  Future<void>getProfile()async{
    loading = true;
    emit(ProfileLoadingState());
    try{
      final failOrUser = await profileUseCase(NoParams());
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          loading = false;
          msgKey.currentState!.showSnackBar(SnackBar(content: Text(fail.message
            ,style: TextStyles.textview14Normal.copyWith(color: white,),)));
          emit(ProfileErrorState(message: fail.message));
        }
      }, (success){
        loading = false;
        profileResponse = success;
        emit(ProfileSuccessState(profileResponse: success));
      });
    }on SocketException catch(e){
      loading = false;
      msgKey.currentState!.showSnackBar(SnackBar(content: Text(e.message
        ,style: TextStyles.textview14Normal.copyWith(color: white,),)));
      emit(ProfileErrorState(message: e.message));
    }
  }
}
