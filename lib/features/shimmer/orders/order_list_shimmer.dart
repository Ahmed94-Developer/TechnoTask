import 'package:flutter/cupertino.dart';
import 'package:task/features/shimmer/orders/order_item_shimmer.dart';

class OrdersShimmerList extends StatelessWidget{
  const OrdersShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(child:
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index)=> const OrderItemShimmer()),);
  }

}