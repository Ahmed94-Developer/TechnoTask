import 'package:flutter/cupertino.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/constants/styles/styles.dart';
import 'package:task/core/widgets/svg_handler.dart';

class UserDataWidget extends StatelessWidget{

  final String name;
  final String phone;

  UserDataWidget({required this.name,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 12),
      decoration: const BoxDecoration(color: white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              customSvg(img: user, width: 20.0, height: 20.0),
              const SizedBox(width: 5,),
              Text(name,style: TextStyles.textview14SemiBold.copyWith(color: black),)
            ],),
          const SizedBox(height: 16,),
          Row(
            children: [
              customSvg(img: call, width: 20.0, height: 20.0),
              const SizedBox(width: 5,),
              Text(phone,style: TextStyles.textview14SemiBold.copyWith(color: black),)
            ],),
        ],
      ),
    );
  }

}