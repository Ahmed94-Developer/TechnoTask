import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task/core/constants/colors/colors.dart';

import '../../../../core/constants/styles/styles.dart';

class MyReviewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: white,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("أحمد عطيه",style: TextStyles.textview15SemiBold.copyWith(color: black),),
              const Spacer(),
              RatingBarIndicator(
                itemCount: 5,
                rating: 3.5,
                itemSize: 20.0,
                unratedColor: unRatedStarColor,
                direction:  Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
               return   const Icon(Icons.star,color: ratedStarColor,size: 35,);

              },)],),
          const SizedBox(height: 16.2,),
          Text('تطبيق ممتاز! يوفر خدمة غسيل سيارات سريعة وفعالة، مع طاقم محترف يعتني بسيارتي جيدًا.',
            style: TextStyles.textview14Normal.copyWith(color: grey),textAlign: TextAlign.center,)
        ],
      ),
    );
  }

}