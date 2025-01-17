import 'package:flutter/cupertino.dart';
import 'package:task/features/orders/domain/entities/orders_response.dart';

import 'order_item.dart';

class OrdersList extends StatelessWidget{
  const OrdersList({super.key, required this.ordersResponse});
  final OrdersResponse ordersResponse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ordersResponse!.data!.length,
        padding: const EdgeInsets.only(top: 4,left: 4,right: 4),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context,index)=>
            OrderItem(orderNum: ordersResponse.data![index].id.toString()
              , title: ordersResponse.data![index].serviceName!
              , date: ordersResponse.data![index].date!
              , status: ordersResponse.data![index].status!,));
  }

}