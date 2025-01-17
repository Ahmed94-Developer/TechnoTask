import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture customSvg({required String img,required double width,required double height}){
  return SvgPicture.asset(img,width: width,height: height,fit: BoxFit.cover,
    alignment: Alignment.center,);
}