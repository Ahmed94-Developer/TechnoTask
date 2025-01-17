import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/main.dart';

import '../constants/styles/styles.dart';
import 'dart:math' as math;

AppBar subPagesAppBar({required String title,required Function()? onPressed,required Color color}){
  return AppBar(
    elevation: 0,
    backgroundColor: color,
    leadingWidth: 240,
    toolbarHeight: 84.0,
    surfaceTintColor: transparent,
    leading: IconButton(
      padding: const EdgeInsets.only(left: 16,right: 16),
      highlightColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      onPressed: onPressed,
      icon:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EasyLocalization.of(navKey.currentContext!)!.currentLocale!.languageCode == "ar" ?  Container(
              alignment: Alignment.center,
              child: customSvg(img: arrowCircleRight, width: 24.0, height: 24.0)) : Transform.rotate(
            angle: 180 * math.pi / 180,
            child: Container(
                alignment: Alignment.center,
                child: customSvg(img: arrowCircleRight, width: 24.0, height: 24.0))
          ),
          const SizedBox(width: 5,),
          Container(
              padding: const EdgeInsets.only(top: 4),
              child: Text(title,style: TextStyles.textview15SemiBold.copyWith(color: titleColor),))
        ],),
      ),
  );
}