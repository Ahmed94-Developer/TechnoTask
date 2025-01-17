import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/widgets/sub_pages_app_bar.dart';
import 'package:task/core/widgets/svg_handler.dart';

import '../../../../core/constants/styles/styles.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subPagesAppBar(title: tr("contact_us"),
          onPressed: (){Navigator.of(context).pop();},color: white),
      backgroundColor: white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Center(child: customSvg(img: contactUs, width: 254, height: 243)),
            const SizedBox(height: 24,),
            Container(
              margin: const EdgeInsets.only(left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Container(
                    alignment: Alignment.center,
                    child: customSvg(img: email, width: 44.0, height: 44.0)),
                  const SizedBox(width: 10,),
                  Text('info@mail.com',style: TextStyles.textview18Normal.copyWith(color: black),)
              ],),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.only(left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: customSvg(img: whatsapp, width: 44.0, height: 44.0)),
                  const SizedBox(width: 10,),
                  Text('+966 123 456 789',style: TextStyles.textview18Normal.copyWith(color: black),)
                ],),
            ),

          ],),
      ),
    );
  }

}