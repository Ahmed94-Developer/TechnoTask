import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/screens/screens.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'dart:math' as math;
import '../../../../core/constants/images/images.dart';
import '../../../../core/constants/styles/styles.dart';

class OrderItem extends StatelessWidget{
  final String orderNum;
  final String title;
  final String date;
  final String status;


  const OrderItem({required this.orderNum,required this.title,required this.date,required this.status,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5,right: 5,left: 5,bottom: 11),
      margin: const EdgeInsets.all(9),
      decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(children: [
        Row(children: [
          Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: lightGreen,shape: BoxShape.circle),
              padding: const EdgeInsets.all(10.25),
              child: customSvg(img: document, width: 24.0, height: 24.0)),
          const SizedBox(width: 5,),
         Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              Text("#$orderNum",style: TextStyles.textview14Normal.copyWith(color: grey2),),
              const SizedBox(height: 14,),
              Text(title,style: TextStyles.textview14Normal.copyWith(color: grey2),),],),
          const Spacer(),


          Text(date,style: TextStyles.textview14SemiBold.copyWith(color: grey2),)
        ],),
        const SizedBox(height: 10,),
        const Divider(color: dividerColor,indent: 13,endIndent: 13,),
        const SizedBox(height: 9,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
              alignment: Alignment.center,
              child: customSvg(img: document, width: 12.0, height: 12.0)),
          const SizedBox(width: 5,),
          Text(tr("order_status"),style: TextStyles.textview14Normal.copyWith(color: grey2),),
          const SizedBox(width: 5,),
          Text(status,style: TextStyles.textview14SemiBold.copyWith(color: black),),
          const Spacer(),
            InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(orderDetailsSc,arguments: orderNum);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(tr("show_more"),style: TextStyles.textview14SemiBold.copyWith(color: grey),),
                  const SizedBox(width: 3,),
                    EasyLocalization.of(context)!.currentLocale!.languageCode == "ar" ?  Container(
                        alignment: Alignment.center,
                        child: customSvg(img: vector, width: 16.0, height: 13.0)) : Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: Container(
                          alignment: Alignment.center,
                          child: customSvg(img: vector, width: 16.0, height: 13.0),),)
                  ],))
          ],)
      ],)

    );
  }

}