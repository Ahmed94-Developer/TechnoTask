import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/styles/styles.dart';

class CarItem extends StatelessWidget{
   const CarItem({super.key, required this.carName, required this.plateNum, required this.carColor
     , required this.carId});

   final String carName;
   final String plateNum;
   final String carColor;
   final String carId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 16,right: 16),

              child: Text('${tr('car')} $carId',style: TextStyles.textview14SemiBold.copyWith(color: black),)),
          const SizedBox(height: 12,),
          Container(
            padding: const EdgeInsets.only(top: 16,bottom: 16,right: 10,left: 10),
            decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  SizedBox(child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr("car"),style: TextStyles.textview14Normal.copyWith(color: grey),),
                      const SizedBox(height: 10,),
                      Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Text(carName,style: TextStyles.textview14SemiBold.copyWith(color: black),))],
                  ),),
                  const Spacer(),
                  SizedBox(child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr("plate_number"),style: TextStyles.textview14Normal.copyWith(color: grey),),
                      const SizedBox(height: 10,),
                      Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Text(plateNum,style: TextStyles.textview14SemiBold.copyWith(color: black),))],
                  ),),],),
                const SizedBox(height: 24,),
                SizedBox(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr("car_color"),style: TextStyles.textview14Normal.copyWith(color: grey),),
                    const SizedBox(height: 10,),
                    Container(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text(carColor.toString(),style: TextStyles.textview14SemiBold.copyWith(color: black),))],
                ),),


              ],
            ),
          ),
        ],
      ),
    );
  }

}