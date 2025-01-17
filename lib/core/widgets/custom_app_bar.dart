import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';

import '../constants/styles/styles.dart';

AppBar customAppBar({required String title}){
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    surfaceTintColor: transparent,
    backgroundColor: transparent,
    toolbarHeight: 80,
    elevation: 0,
    title: Container(
        padding: const EdgeInsets.only(top: 4),
        child: Text(title,style: TextStyles.textview16SemiBold.copyWith(color: titleColor,),)),
  );
}