import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/core/constants/colors/colors.dart';

class OrderItemShimmer extends StatelessWidget{
  const OrderItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5,right: 5,left: 5,bottom: 11),
        margin: const EdgeInsets.all(9),
        decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(children: [
          Row(children: [
            Shimmer.fromColors(baseColor: grey
                , highlightColor: white, child: Container
                  ( width: 50.0,height: 50.0,
                  decoration:  BoxDecoration(shape: BoxShape.circle,color: grey.withOpacity(.42))
                       ),),
            const SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(baseColor: grey
                    , highlightColor: white, child: Container
                      ( width: 40.0,height: 7.0,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                          ,color: grey.withOpacity(.32) ),)),
                const SizedBox(height: 14,),
                Shimmer.fromColors(baseColor: grey, highlightColor: white, child: Container
                  (width: 80.0,height: 8.0,
            decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                ,color: grey.withOpacity(.32) ),)),],),
            const Spacer(),

            Shimmer.fromColors(baseColor: grey
                , highlightColor: white, child: Container
                  ( width: 100.0,height: 8.0,
                  decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                      ,color: grey.withOpacity(.32) ),)),
          ],),
          const SizedBox(height: 10,),
          const Divider(color: dividerColor,indent: 13,endIndent: 13,),
          const SizedBox(height: 9,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container
                    ( width: 15.0,height: 15.0,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4))
                        ,color: grey.withOpacity(.32) ),)),
              const SizedBox(width: 5,),
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container
                    ( width: 70.0,height: 8.0,
                    decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.32) ),)),
              const SizedBox(width: 5,),
              Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container
                    ( width: 40.0,height: 8.0,
                    decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.32) ),)),
              const Spacer(),
               Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(baseColor: grey, highlightColor: white, child: Container
                        (width: 80.0,height: 10.0,
                        decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                            ,color: grey.withOpacity(.32) ),)),
                      const SizedBox(width: 3,),
                    ],)
            ],)
        ],)

    );
  }

}