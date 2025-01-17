import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/shimmer/orders/order_list_shimmer.dart';

import '../../../../core/constants/colors/colors.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/no_orders_widgets.dart';
import '../widgets/order_item.dart';
import '../widgets/orders_list.dart';

class CompletedOrdersScreen extends StatefulWidget{
  const CompletedOrdersScreen({super.key});

  @override
  State<CompletedOrdersScreen> createState() => _CompletedOrdersScreen();

}

class _CompletedOrdersScreen extends State<CompletedOrdersScreen> {
  @override
  void initState() {
    context.read<OrdersCubit>().getCompletedOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<OrdersCubit,OrdersState>(
        builder: (context, state) {
          return context.read<OrdersCubit>().completedOrderLoading == true ?
          const OrdersShimmerList() :
          context.read<OrdersCubit>().ordersResponse!.data == null ?
          NoOrderWidget() :
          OrdersList(ordersResponse: context.read<OrdersCubit>().ordersResponse!);
        },
      ),);
  }
}