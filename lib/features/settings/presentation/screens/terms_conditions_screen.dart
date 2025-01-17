import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/images/images.dart';
import '../../../../core/constants/styles/styles.dart';
import '../../../../core/widgets/sub_pages_app_bar.dart';
import '../../../../core/widgets/svg_handler.dart';

class TermsConditionsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: white,
      appBar: subPagesAppBar(title: tr("terms"),
          onPressed: (){Navigator.of(context).pop();},color: white),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(left: 8,right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24,),
            customSvg(img: loginLogo, width: 148.0, height: 188.0),
            const SizedBox(height: 32.78,),
            Flexible(
              child: SingleChildScrollView(
                child: Text('تعتبر هذه الشروط والأحكام بمثابة اتفاق بينك وبين تطبيق "هذا مكانك" لخدمات غسيل السيارات، والتي تحدد القواعد والالتزامات التي يجب أن يلتزم بها المستخدم'
                    ' عند استخدامه للتطبيق. باستخدامك للتطبيق، فإنك توافق على جميع الشروط والأحكام الواردة هنا وتقر بأنك قد قرأتها وفهمتها.'
                    ' يحق للتطبيق تعديل هذه الشروط في أي وقت، وتكون التعديلات سارية'
                    ' فور نشرها على التطبيق. يجب على المستخدمين تقديم معلومات صحيحة ودقيقة'
                    ' عند التسجيل في التطبيق، ويجب أن يكونوا في سن قانونية لاستخدامه'
                    ' أو يمتلكون إذنًا من الوالدين أو الوصي القانوني.'
                    'يتم تقديم خدمات غسيل السيارات عبر التطبيق بأسعار تتحدد بناءً على نوع الخدمة'
                    ' وحجم السيارة. يمكن للمستخدم اختيار الخدمة التي يرغب بها،'
                    ' ويجب عليه دفع المبالغ المستحقة عبر الوسائل المتاحة داخل التطبيق.'
                  ,style: TextStyles.textview14Normal.copyWith(color: grey),textAlign: TextAlign.center,),
              ),
            )
          ],),
      ),

    );
  }

}