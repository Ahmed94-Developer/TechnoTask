import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/constants/styles/styles.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/orders/presentation/widgets/order_details_cart_item.dart';

class OrderDetailsCart extends StatelessWidget{
  final String orderNum;
  final String serviceName;
  final String orderTime;
  final String orderDate;
  final String address;
  final String washingType;
  final String additionalService;
  final String products;


  const OrderDetailsCart(
      {required this.orderNum,
     required this.serviceName,
     required this.orderTime,
     required this.orderDate,
     required this.address,
     required this.washingType,
     required this.additionalService,
     required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16,bottom: 16,right: 10,left: 20),
      margin: const EdgeInsets.only(left: 16,right: 16),
      decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      width: double.infinity,
      child: Column(
        children: [
          OrderDetailsCartItem(tr("order_num"),tr("selected_services"), orderNum, serviceName),

          const SizedBox(height: 24,),
          OrderDetailsCartItem(tr("order_time"),tr("order_date"), orderTime, orderDate),


          const SizedBox(height: 24,),
          OrderDetailsCartItem(tr("address"),tr("washing_type"),address, washingType),

          const SizedBox(height: 24,),

          OrderDetailsCartItem(tr("additional_service"),tr("products"),additionalService, products),

        ],
      ),
    );
  }

}