import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/widgets/svg_handler.dart';

import '../../../../core/constants/styles/styles.dart';

class NoOrderWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customSvg(img: emptyOrders, width: 274.0, height: 179.3),
        const SizedBox(height: 25,),
        Text(tr("no_orders"),style: TextStyles.textview16SemiBold.copyWith(color: black),),
        const SizedBox(height: 16,),
        Container(
          margin: const EdgeInsets.only(left: 16,right: 15),
          child: Text(tr("no_orders_desc"),style: TextStyles.textview14Normal.copyWith(color: grey),
            textAlign: TextAlign.center,),
        )
      ],
      ),
    );
  }

}