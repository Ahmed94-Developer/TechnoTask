import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/styles/styles.dart';
import '../cubit/orders_cubit.dart';

class OrderTabItem extends StatelessWidget{
  final String tabName;
  final Color tabBgColor;
  final Color tabTextColor;


  const OrderTabItem({required this.tabName,required this.tabBgColor,required this.tabTextColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(
          left: 27, right: 27, top: 18, bottom: 18),
      decoration: BoxDecoration(color: tabBgColor, borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Text(tabName, style: TextStyles
          .textview16SemiBold.copyWith(color: tabTextColor),),
    );
  }

}