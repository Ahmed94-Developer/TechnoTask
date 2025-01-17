import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors/colors.dart';

class CarItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 16,right: 16),
              child:   Shimmer.fromColors(baseColor: grey
                  , highlightColor: white, child: Container
                    ( width: 40.0,height: 7.0,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                        ,color: grey.withOpacity(.32) ),)),),
          const SizedBox(height: 12,),
          Container(
            padding: const EdgeInsets.only(top: 16,bottom: 16,right: 10,left: 10),
            decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(baseColor: grey
                        , highlightColor: white, child: Container
                      ( width: 50.0,height: 7.0,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                          ,color: grey.withOpacity(.32) ),)),
                        const SizedBox(height: 10,),
                        Shimmer.fromColors(baseColor: grey
                            , highlightColor: white, child: Container
                              ( width: 45.0,height: 7.0,
                              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                                  ,color: grey.withOpacity(.32) ),)),],
                    ),),
                    const Spacer(),
                    SizedBox(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(baseColor: grey
                        , highlightColor: white, child: Container
                      ( width: 50.0,height: 7.0,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                          ,color: grey.withOpacity(.32) ),)),
                        const SizedBox(height: 10,),
                    Shimmer.fromColors(baseColor: grey
                        , highlightColor: white, child: Container
                          ( width: 30.0,height: 7.0,
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                              ,color: grey.withOpacity(.32) ),)),],
                    ),),],),
                const SizedBox(height: 24,),
                SizedBox(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(baseColor: grey
                        , highlightColor: white, child: Container
                          ( width: 40.0,height: 7.0,
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                              ,color: grey.withOpacity(.32) ),)),
                    const SizedBox(height: 10,),
                    Shimmer.fromColors(baseColor: grey
                        , highlightColor: white, child: Container
                          ( width: 50.0,height: 7.0,
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                              ,color: grey.withOpacity(.32) ),)),],
                ),),


              ],
            ),
          ),
        ],
      ),
    );
  }

}