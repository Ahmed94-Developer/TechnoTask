import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/features/orders/presentation/widgets/invoice_item.dart';

class InvoiceCart extends StatelessWidget{
  const InvoiceCart({super.key, required this.servicePrice, required this.products, required this.additonalService, required this.tax, required this.total});
  final String servicePrice;
  final String products;
  final String additonalService;
  final String tax;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: const EdgeInsets.only(top: 15,bottom: 18,left: 10,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InvoiceItem(invoiceTitle: tr("service_price"), price: servicePrice,txtColor: grey,),
          const SizedBox(height: 18,),
          InvoiceItem(invoiceTitle: tr("products"), price: products,txtColor: grey,),
          const SizedBox(height: 18,),
          InvoiceItem(invoiceTitle: tr("additional_services"), price: additonalService,txtColor: grey,),
          const SizedBox(height: 18,),
          InvoiceItem(invoiceTitle: tr("value_added_tax"), price: tax,txtColor: grey,),
          const SizedBox(height: 18,),
          const Divider(color: dividerColor2,indent: 11.0,endIndent: 11.0,),
          const SizedBox(height: 18,),
          InvoiceItem(invoiceTitle: tr("total"), price: total,txtColor: black,),
        ],),

    );
  }

}