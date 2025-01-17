import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/styles/styles.dart';
import '../../../../core/widgets/image_handler.dart';
import '../cubit/language_cubit.dart';

class LanguageItem extends StatelessWidget{
  final Function()? onTap;
  final Color color;
  final Color borderColor;
  final String langImg;
  final Color langTxtColor;
  final String langType;

  const LanguageItem(
      {required this.onTap,
     required this.color,
     required this.langImg,
     required this.langTxtColor,
      required this.langType, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 58,bottom: 58),
        alignment: Alignment.center,
        decoration:  BoxDecoration(
            color: color ,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(color: borderColor)
        ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: ImageHandlerWidget(img: langImg, width: 50.0, height: 31.0)),
            const SizedBox(height: 6,),
            Text(langType,style: TextStyles.textview14Bold.copyWith(color: langTxtColor),)
          ],
        ),
      ),
    ));
  }

}