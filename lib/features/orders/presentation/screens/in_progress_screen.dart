import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/orders/presentation/widgets/no_orders_widgets.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../shimmer/orders/order_list_shimmer.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/order_item.dart';
import '../widgets/orders_list.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();

}

class _InProgressScreenState extends State<InProgressScreen> {

  @override
  void initState() {
    context.read<OrdersCubit>().getInProgressOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<OrdersCubit,OrdersState>(
        builder: (context, state) {
          return context.read<OrdersCubit>().inProgressLoading == true ?
          const  OrdersShimmerList() :
          context.read<OrdersCubit>().ordersResponse!.data == null ?
              NoOrderWidget() :
          OrdersList(ordersResponse: context.read<OrdersCubit>().ordersResponse!);
        },
      ),);
  }
}