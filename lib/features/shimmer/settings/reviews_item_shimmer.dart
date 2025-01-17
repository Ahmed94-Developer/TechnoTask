import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors/colors.dart';

class ReviewsItemShimmer extends StatelessWidget{
  const ReviewsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: white,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Shimmer.fromColors(baseColor: grey
          , highlightColor: white, child: Container( width: 90.0,height: 10.0,
        decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
            ,color: grey.withOpacity(.42) ),)),
              const Spacer(),
      Shimmer.fromColors(baseColor: grey
          , highlightColor: white, child: Container
            ( width: 110.0,height: 12.0,
            decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                ,color: grey.withOpacity(.42) ),))],),
          const SizedBox(height: 16.2,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(baseColor: grey
              , highlightColor: white, child: Container( width: 170,height: 8.0,
            decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                ,color: grey.withOpacity(.42) ),)),
              const SizedBox(height: 3,),
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container( width: 170,height: 8.0,
                    decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.42) ),)),
              const SizedBox(height: 3,),
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container( width: 170,height: 8.0,
                    decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.42) ),)),
            ],)
        ],
      ),
    );
  }

}