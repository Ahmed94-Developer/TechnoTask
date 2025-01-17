import 'package:flutter/cupertino.dart';
import 'package:task/features/shimmer/orders/order_details_shimmer_item.dart';

import '../../../core/constants/colors/colors.dart';

class OrderDetailsCartShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16,bottom: 16,right: 10,left: 20),
      margin: const EdgeInsets.only(left: 16,right: 16),
      decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      width: double.infinity,
      child: const Column(
        children: [
          OrderDetailsShimmerItem(),

          SizedBox(height: 24,),
          OrderDetailsShimmerItem(),


          SizedBox(height: 24,),
          OrderDetailsShimmerItem(),

          SizedBox(height: 24,),

          OrderDetailsShimmerItem(),

        ],
      ),
    );
  }

}