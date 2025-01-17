import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors/colors.dart';

class UserDataShimmer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 12),
      decoration: const BoxDecoration(color: white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
      Shimmer.fromColors(baseColor: grey
          , highlightColor: white, child: Container
        ( width: 20.0,height: 20.0,
        decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
            ,color: grey.withOpacity(.32) ),)),
              const SizedBox(width: 5,),
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container
                    ( width: 80.0,height: 7.0,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.32) ),)),
            ],),
          const SizedBox(height: 16,),
          Row(
            children: [
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container
                    ( width: 20.0,height: 20.0,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.32) ),)),
              const SizedBox(width: 5,),
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container
                    ( width: 100.0,height: 7.0,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.32) ),)),
            ],),
        ],
      ),
    );
  }

}