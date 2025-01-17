import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/widgets/custom_app_bar.dart';
import 'package:task/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:task/features/orders/presentation/screens/completed_orders_screen.dart';
import 'package:task/features/orders/presentation/screens/in_progress_screen.dart';
import 'package:task/features/orders/presentation/screens/scheduled_orders_screen.dart';
import 'package:task/features/orders/presentation/widgets/no_orders_widgets.dart';
import 'package:task/features/orders/presentation/widgets/order_tab_item.dart';

import '../../../../core/constants/styles/styles.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();

}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin{
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: tr("my_orders")),
      backgroundColor: bgColor,

      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12,),
          BlocBuilder<OrdersCubit, OrdersState>(
  builder: (context, state) {
    return TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.center,
        indicatorColor: transparent,
        dividerColor: transparent,
        automaticIndicatorColorAdjustment: true,
        indicatorWeight: 0.0,
        indicator: const BoxDecoration(color: tabColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        unselectedLabelColor: grey,
        isScrollable: true,
        labelColor: black,
        labelStyle: TextStyles.textview16Bold.copyWith(color: black),
        indicatorPadding: const EdgeInsets.only(left: 16, right: 16),
        onTap: (int? val) {
          context.read<OrdersCubit>().updateIndex(index: val!);

        },

        unselectedLabelStyle: TextStyles.textview16Bold.copyWith(color: grey),
        tabs: [
          OrderTabItem(tabName: tr("scheduled"), tabBgColor: context.read<OrdersCubit>().ind == 0 ? tabColor :
          white, tabTextColor: context.read<OrdersCubit>().ind == 0 ? black : grey),

          OrderTabItem(tabName: tr("in_progress"), tabBgColor: context.read<OrdersCubit>().ind == 1 ? tabColor :
          white, tabTextColor: context.read<OrdersCubit>().ind == 1 ? black : grey),

          OrderTabItem(tabName: tr("completed"), tabBgColor: context.read<OrdersCubit>().ind == 2 ? tabColor :
          white, tabTextColor: context.read<OrdersCubit>().ind == 2 ? black : grey)

        ]);},),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ScheduledOrdersScreen(),
                        InProgressScreen(),
                    CompletedOrdersScreen()
                  ]),
            )
        ],),
      ),
    );
  }
}