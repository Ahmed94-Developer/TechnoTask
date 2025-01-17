import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'dart:math' as math;
import '../../../../core/constants/styles/styles.dart';

class MoreItem extends StatelessWidget{
  final String img;
  final String name;
  final Color color;
  final Color textColor;
  final Function()? onTap;
  final String type;
  MoreItem({required this.img,required this.name,required this.color
    ,required this.textColor, this.onTap, required this.type,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(4.0))),
                child: customSvg(img: img, width: 19, height: 29,)),
            const SizedBox(width: 7,),
            Text(name,style: TextStyles.textview14SemiBold.copyWith(color: textColor),),
            const Spacer(),
          EasyLocalization.of(context)!.currentLocale!.languageCode == "ar" ?  Container(
                  alignment: Alignment.center,
                  child:  type == 'logout' ? const SizedBox() :
                  customSvg(img: greenVector, width: 20, height: 20)) : Transform.rotate(
            angle: 180 * math.pi / 180,
            child: Container(
                alignment: Alignment.center,
                child: type == 'logout' ? const SizedBox() :
                customSvg(img: greenVector, width: 20, height: 20)),),
            const SizedBox(width: 8.3,)
          ],),
      ),
    );
  }

}