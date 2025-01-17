import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors/colors.dart';

class OrderDetailsShimmerItem extends StatelessWidget{
  const OrderDetailsShimmerItem({super.key});


    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                    ( width: 30.0,height: 7.0,
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
                ( width: 70.0,height: 7.0,
                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                    ,color: grey.withOpacity(.32) ),)),],
          ),),],);
    }

}