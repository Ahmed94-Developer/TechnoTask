import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/widgets/fluttertoast.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/main.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/styles/styles.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  String? selectedLang;
  FToast fToast = FToast();

  Future<void>selectedLanguage({required String selected})async{
    selectedLang = selected;
    emit(UpdateSelectedLanguage());
  }
  Future<void>initFlutterToast()async{
    fToast.init(navKey.currentContext!);
  }
  Future<void>showToast()async{
    fToast.showToast(
      child: Container(
        alignment: Alignment.center,
        width: 280,
        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 7,right: 7),
        decoration:   BoxDecoration(color: black.withOpacity(.72),
            borderRadius: const BorderRadius.all(Radius.circular(25.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customSvg(img: language, width: 30, height: 30),
            const SizedBox(width: 5,),
            Text(tr("lang_saved"),style: TextStyles.textview14Normal.copyWith(color: white),)
          ],),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }
  Future<void>setLanguage()async{
    selectedLang = EasyLocalization.of(navKey.currentContext!)!.currentLocale!.languageCode;
  }
}
