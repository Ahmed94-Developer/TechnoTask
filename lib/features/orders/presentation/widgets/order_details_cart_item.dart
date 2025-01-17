import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/styles/styles.dart';

class OrderDetailsCartItem extends StatelessWidget {
  final String title;
  final String title2;
  final String titleName;
  final String titleName2;


  OrderDetailsCartItem(this.title, this.title2, this.titleName, this.titleName2);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr(title),style: TextStyles.textview14Normal.copyWith(color: grey),),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child:
              Text(titleName
                ,style: TextStyles.textview14SemiBold.
                copyWith(color: black,),),
            )],
        ),),
        const Spacer(),
        SizedBox(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr(title2),style: TextStyles.textview14Normal.copyWith(color: grey),),
            const SizedBox(height: 10,),
            Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Text(titleName2,style: TextStyles.textview14SemiBold.copyWith(color: black),))],
        ),),],);
  }

}