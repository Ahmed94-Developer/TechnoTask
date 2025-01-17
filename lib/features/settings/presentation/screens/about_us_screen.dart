import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/widgets/sub_pages_app_bar.dart';
import 'package:task/core/widgets/svg_handler.dart';

import '../../../../core/constants/styles/styles.dart';

class AboutusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: subPagesAppBar(title: tr("about_us"),
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
                child: Text('نحن في تطبيق "هذا مكانك" نقدر خصوصيتك ونعمل جاهدين'
                    ' لحمايتها. تشرح هذه السياسة كيفية جمع واستخدام وحماية المعلومات الشخصية التي تقدمها عند استخدامك للتطبيق. باستخدامك للتطبيق، فإنك توافق على جمع واستخدام هذه المعلومات وفقًا لهذه السياسة.جمع المعلومات: نقوم بجمع المعلومات الشخصية التي تقدمها عند التسجيل في التطبيق أو عند تقديم طلبات الخدمة، وتشمل هذه المعلومات: الاسم، رقم الهاتف، عنوان البريد الإلكتروني، تفاصيل الدفع، وموقعك الجغرافي. قد نستخدم'
                    ' أيضًا بعض المعلومات'
                    ' غير الشخصية مثل نوع الجهاز ونظام التشغيل لتقديم الخدمة بشكل أفضل.',
                    style: TextStyles.textview14Normal.copyWith(color: grey),textAlign: TextAlign.center,),
              ),
            )
          ],),
      ),

    );
  }

}