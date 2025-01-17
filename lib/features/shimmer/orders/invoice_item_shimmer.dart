import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors/colors.dart';

class InvoiceItemShimmer extends StatelessWidget {
  const InvoiceItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(baseColor: grey
          , highlightColor: white, child: Container
        ( width: 100.0,height: 7.0,
        decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
            ,color: grey.withOpacity(.32) ),)),
        const Spacer(),
    Shimmer.fromColors(baseColor: grey
    , highlightColor: white, child: Container
    ( width: 40.0,height: 7.0,
    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
    ,color: grey.withOpacity(.32) ),)),
        ],),
    );
  }

}