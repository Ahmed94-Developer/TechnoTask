import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/widgets/sub_pages_app_bar.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/orders/domain/entities/order_details_params.dart';
import 'package:task/features/orders/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:task/features/orders/presentation/widgets/car_item.dart';
import 'package:task/features/orders/presentation/widgets/invoice_cart.dart';
import 'package:task/features/orders/presentation/widgets/note_item.dart';
import 'package:task/features/orders/presentation/widgets/order_details_cart.dart';
import 'package:task/features/orders/presentation/widgets/user_data_widget.dart';
import 'package:task/features/shimmer/orders/car_item_shimmer.dart';
import 'package:task/features/shimmer/orders/invoice_cart_shimmer.dart';
import 'package:task/features/shimmer/orders/order_details_cart_shimmer.dart';
import 'package:task/features/shimmer/orders/user_data_shimmer.dart';

import '../../../../core/constants/styles/styles.dart';

class OrdersDetailsScreen extends StatefulWidget{
  const OrdersDetailsScreen({super.key, required this.orderId});
  final String orderId;




  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();

}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {

  @override
  void initState() {
    context.read<OrderDetailsCubit>().getOrderDetails(params: OrderDetailsParams(orderId: widget.orderId));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subPagesAppBar(title: tr("order_details",),color: bgColor,
          onPressed: (){Navigator.of(context).pop();}),
      backgroundColor: bgColor,

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8,),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 16,right: 16),
                padding: const EdgeInsets.only(top: 16,bottom: 16,),
                decoration: const BoxDecoration(color: lightGreen,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Text(tr("order_scheduled"),
                  style: TextStyles.textview14SemiBold.copyWith(color: black),textAlign: TextAlign.center,),),
              const SizedBox(height: 16,),
              Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: Text(tr("order_details"),style: TextStyles.textview14SemiBold.copyWith(color: black),)),
              const SizedBox(height: 12,),
              BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                builder: (context, state) {
                  return context.read<OrderDetailsCubit>().orderDetailsLoading == true ?
                   OrderDetailsCartShimmer():
                  context.read<OrderDetailsCubit>().orderDetailsResponse!.data == null ? const SizedBox() :
                  OrderDetailsCart(orderNum: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!
                      .id.toString()
                    , serviceName: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.serviceName,
                    orderTime: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.time,
                    orderDate: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.date
                    , address: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.address,
                    washingType: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.washType,
                    additionalService:
                    context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.additionalServices!.isEmpty ? ''
                        : context.read<OrderDetailsCubit>().orderDetailsResponse!
                        .data!.additionalServices![0].name!,
                    products: context.read<OrderDetailsCubit>().orderDetailsResponse!
                        .data!.products!.isEmpty ? ''
                        : context.read<OrderDetailsCubit>().orderDetailsResponse!.data!
                        .products![0].name!,);
                },
              ),
              const SizedBox(height: 16,),
              BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                builder: (context, state) {
                  return context.read<OrderDetailsCubit>().orderDetailsLoading == true ?
                  CarItemShimmer() :

                  (context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.cars!.isEmpty ||
                      context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.cars == null )?
                      const SizedBox() :
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.cars!.length,
                            itemBuilder: (context,index)=> CarItem(
                              carName: context.read<OrderDetailsCubit>().orderDetailsResponse!
                                .data!.cars![index].brand
                          , plateNum: context.read<OrderDetailsCubit>()
                                  .orderDetailsResponse!.data!.cars![index].licensePlate
                          , carColor: context.read<OrderDetailsCubit>()
                                  .orderDetailsResponse!.data!.cars![index].color,
                              carId: context.read<OrderDetailsCubit>()
                                  .orderDetailsResponse!.data!.cars![index].id.toString(),)),
                      );
                },
              ),
              const SizedBox(height: 16,),
              Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: Text(tr("notes"),style: TextStyles.textview14SemiBold.copyWith(color: black),)
              ),
              const SizedBox(height: 12,),
              Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                    builder: (context, state) {
                      return   context.read<OrderDetailsCubit>().orderDetailsLoading == true ?
                      Shimmer.fromColors(baseColor: grey
                          , highlightColor: white, child: Container
                            ( width: 90.0,height: 7.0,
                            decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
                                ,color: grey.withOpacity(.32) ),)) :
                      context.read<OrderDetailsCubit>().orderDetailsResponse!.data == null ?
                      NoteItem(note: '') :
                      NoteItem(note: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.notes.toString());
                    },
                  )),
              const SizedBox(height: 16,),
              Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: Text(tr("invoice"),style: TextStyles.textview14SemiBold.copyWith(color: black),)),
              const SizedBox(height: 12,),
              BlocBuilder<OrderDetailsCubit,OrderDetailsState>(
                builder: (context, state) {
                  return context.read<OrderDetailsCubit>().orderDetailsLoading == true ?
                 InvoiceCartShimmer() :
                  Container(
                      margin: const EdgeInsets.only(left: 16,right: 16),
                      child: InvoiceCart(servicePrice: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!
                          .bill!.servicePricing.toString(),
                        products: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!
                            .bill!.productsPrice.toString(), additonalService:
                        context.read<OrderDetailsCubit>().orderDetailsResponse!.data!
                            .bill!.additionalServicesPrice.toString()
                        , tax: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!
                            .bill!.vat.toString(), total:
                        context.read<OrderDetailsCubit>().orderDetailsResponse!.data!
                            .bill!.total.toString(),));
                },
              ),
              const SizedBox(height: 16,),
              Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: Text(tr("payment_method"),style: TextStyles.textview14SemiBold.copyWith(color: black),)),
              const SizedBox(height: 12,),
              Container(
                margin: const EdgeInsets.only(left: 16,right: 16),
                padding: const EdgeInsets.only(left: 13,top: 13,bottom: 13,right: 13),
                decoration: const BoxDecoration(color: lightGreen,borderRadius:
                BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: customSvg(img: wallet, width: 20.0, height: 20.0)),
                    const SizedBox(width: 5,),
                    Text(tr("wallet"),style: TextStyles.textview14Normal.copyWith(color: black),)
                  ],),),
              const SizedBox(height: 16,),
              Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: Text(tr("customer_data"),style: TextStyles.textview14SemiBold.copyWith(color: black),)),
              const SizedBox(height: 12,),
              Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                    builder: (context, state) {
                      return  context.read<OrderDetailsCubit>().orderDetailsLoading == true ?
                      UserDataShimmer():

                      UserDataWidget(name: context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.customer!.name!
                          , phone:  context.read<OrderDetailsCubit>().orderDetailsResponse!.data!.customer!.phone!);
                    },
                  )),
              const SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}