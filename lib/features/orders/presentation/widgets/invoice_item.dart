import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/styles/styles.dart';

class InvoiceItem extends StatelessWidget {
  final String invoiceTitle;
  final String price;
  final Color txtColor;

  InvoiceItem({required this.invoiceTitle,required this.price, required this.txtColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(invoiceTitle,style: TextStyles.textview14Normal.copyWith(color: txtColor),),
          const Spacer(),
          Text('$price ${tr("r.s")}',style: TextStyles.textview14Normal.copyWith(color: txtColor),),
        ],),
    );
  }

}