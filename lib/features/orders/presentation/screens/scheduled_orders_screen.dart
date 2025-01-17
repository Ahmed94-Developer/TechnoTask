import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:task/features/orders/presentation/widgets/no_orders_widgets.dart';
import 'package:task/features/orders/presentation/widgets/order_item.dart';
import 'package:task/features/orders/presentation/widgets/orders_list.dart';
import 'package:task/features/shimmer/orders/order_list_shimmer.dart';

class ScheduledOrdersScreen extends StatefulWidget {
  const ScheduledOrdersScreen({super.key});

  @override
  State<ScheduledOrdersScreen> createState() => _ScheduledScreenState();

}

class _ScheduledScreenState extends State<ScheduledOrdersScreen> {

  @override
  void initState() {
    context.read<OrdersCubit>().getScheduledOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child:
      BlocBuilder<OrdersCubit,OrdersState>(
        builder: (context, state) {
          return context.read<OrdersCubit>().orderLoading == true ?
              const OrdersShimmerList():
          context.read<OrdersCubit>().ordersResponse!.data == null ?
              NoOrderWidget() :

              OrdersList(ordersResponse: context.read<OrdersCubit>().ordersResponse!);

        },
      ),);
  }
}