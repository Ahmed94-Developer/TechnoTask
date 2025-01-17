import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/size_config/dimensions.dart';
import 'package:task/core/constants/styles/styles.dart';
import 'package:task/core/widgets/image_handler.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:task/features/orders/presentation/widgets/no_orders_widgets.dart';
import 'package:task/features/orders/presentation/widgets/order_item.dart';
import 'package:task/features/orders/presentation/widgets/orders_list.dart';
import 'package:task/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:task/features/shimmer/orders/order_list_shimmer.dart';
import 'package:task/features/shimmer/profile/profile_text_shimmer.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/images/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    context.read<OrdersCubit>().getScheduledOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      Container(
      color: black.withOpacity(.12),
      padding: const EdgeInsets.only(bottom: 25),
      child: Stack(
        alignment: Alignment.bottomLeft,
        clipBehavior: Clip.none,
        children: [
          Container(alignment: Alignment.center,
            child: ColorFiltered(
                colorFilter:  ColorFilter.mode(homeProfileColor.withOpacity(.7), BlendMode.lighten),
                child: ImageHandlerWidget(img: bubbles, width: double.infinity,height: screenHeight/3.2,)
                ),
          ),

          Container(
              margin: EdgeInsets.only(bottom: screenHeight/6.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 16,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(tr('welcome'),style: TextStyles.textview14Normal.copyWith(color: white),
                      textAlign: TextAlign.start,),
                    const SizedBox(height: 12,),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return context.read<ProfileCubit>().loading == true ?
                            const ProfileTextShimmer(width: 70,) :
                        context.read<ProfileCubit>().profileResponse == null ?
                        Text('User name'
                          ,style: TextStyles.textview16Bold.copyWith(color: white),) :
                          Text('${context.read<ProfileCubit>().profileResponse!.data!.user!.name}'!
                            ,style: TextStyles.textview16Bold.copyWith(color: white),);
                        },
                    )
                  ],),
                  const Spacer(),
                  customSvg(img: notification, width: 27.0, height: 24.0),
                  const SizedBox(width: 16,)
                ],)),
          Positioned(
              bottom: -33,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset(car,width: 190,height: 109,fit: BoxFit.cover,),)),],)),
            Expanded(child: Container(
              color: bgColor,
              child: BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  return context.read<OrdersCubit>().orderLoading == true ?
                      const OrdersShimmerList():
                      (context.read<OrdersCubit>().ordersResponse!.data!.isEmpty ||
                      context.read<OrdersCubit>().ordersResponse!.data == null) ?

                      NoOrderWidget() :

                      OrdersList(ordersResponse: context.read<OrdersCubit>().ordersResponse!);
  },
),
            ),)

          ]));
  }
}