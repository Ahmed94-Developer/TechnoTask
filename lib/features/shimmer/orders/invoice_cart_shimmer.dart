import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/features/shimmer/orders/invoice_item_shimmer.dart';

import '../../../core/constants/colors/colors.dart';

class InvoiceCartShimmer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: const EdgeInsets.only(top: 15,bottom: 18,left: 10,right: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         InvoiceItemShimmer(),
          SizedBox(height: 18,),
         InvoiceItemShimmer(),
          SizedBox(height: 18,),
          InvoiceItemShimmer(),
          SizedBox(height: 18,),
         InvoiceItemShimmer(),
          SizedBox(height: 18,),
          Divider(color: dividerColor2,indent: 11.0,endIndent: 11.0,),
          SizedBox(height: 18,),
         InvoiceItemShimmer(),
        ],),

    );
  }
}