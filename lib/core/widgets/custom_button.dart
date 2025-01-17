import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';

import '../constants/styles/styles.dart';

class CustomButton extends StatelessWidget{
  final String btnName;
  final Function()? onPressed;


  CustomButton({required this.btnName,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: MaterialButton(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        onPressed: onPressed,
        color: btnColor,
        padding: const EdgeInsets.only(top: 0,bottom: 0),
        child: Text(btnName,style: TextStyles.textview18SemiBold.copyWith(color: white),
          textAlign: TextAlign.center,),),
    );
  }

}