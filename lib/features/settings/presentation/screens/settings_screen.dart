
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/injection_container/injection_container.dart';
import 'package:task/main.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/images/images.dart';
import '../../../../core/constants/screens/screens.dart';
import '../../../../core/constants/styles/styles.dart';
import '../../../../core/widgets/awesome_dialog/anims/native_animations.dart';
import '../../../../core/widgets/awesome_dialog/awesome_dialog.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/more_item.dart';

class SettingScreen extends StatelessWidget{
  const SettingScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: customAppBar(title: tr("more")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 16,right: 16),
            decoration: const BoxDecoration(color: moreBgColor,
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MoreItem(img: profile, name: tr("user_profile"), color: btnColor,
                  textColor: black,onTap: (){
                    Navigator.of(context).pushNamed(profileSc);
                  }, type: '',),
                const Divider(color: dividerColor3,indent: 16.0,endIndent: 16.0,),
                MoreItem(img: star, name: tr("my_reviews"), color: btnColor, textColor: black,onTap: (){
                  Navigator.of(context).pushNamed(myReviewsSc);
                }, type: '',),
                const Divider(color: dividerColor3,indent: 16.0,endIndent: 16.0,),
                MoreItem(img: language, name: tr("language"), color: btnColor, textColor: black,
                  onTap: (){
                  Navigator.of(context).pushNamed(languageSc);
                }, type: '',),
                const Divider(color: dividerColor3,indent: 16.0,endIndent: 16.0,),
                MoreItem(img: aboutUs, name: tr("about_us"), color: btnColor,
                  textColor: black,onTap: (){
                  Navigator.of(context).pushNamed(aboutSc);
                  }, type: '',),
                const Divider(color: dividerColor3,indent: 16.0,endIndent: 16.0,),
                MoreItem(img: callCalling, name: tr("contact_us"), color: btnColor,
                  textColor: black,onTap: (){
                  Navigator.of(context).pushNamed(contactUs);
                  }, type: '',),
                const Divider(color: dividerColor3,indent: 16.0,endIndent: 16.0,),
                MoreItem(img: terms, name: tr("terms"),
                  color: btnColor, textColor: black,onTap: (){
                  Navigator.of(context).pushNamed(termsSc);
                  }, type: '',),
                const Divider(color: dividerColor3,indent: 16.0,endIndent: 16.0,),
                MoreItem(img: privacy, name: tr("privacy"), color: btnColor,
                  textColor: black,onTap: (){
                    Navigator.of(context).pushNamed(privacySc);
                  }, type: '',),
                const Divider(color: dividerColor3,indent: 16.0,endIndent: 16.0,),
                MoreItem(img: logout, name: tr("log_out"),
                  color: red, textColor: red, type: 'logout',onTap: (){
                    AwesomeDialog(
                        context: context,
                        customHeader: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                darkGreen,
                                white],
                                  stops: [0.0, 1.0],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  tileMode: TileMode.repeated
                              )),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,child: customSvg(img: loginLogo,
                              width: 40, height: 80),),
                        animType: AnimType.rightSlide,
                        title: tr("log_out"),
                        desc: tr("log_out_question"),
                        descTextStyle: TextStyles.textview14SemiBold.copyWith(color: black),
                        btnCancelOnPress: () {},
                      btnOkText: tr("ok"),
                      titleTextStyle: TextStyles.textview14Normal,
                      buttonsTextStyle: TextStyles.textview14Bold.copyWith(color: white),
                      btnCancelText: tr("cancel"),
                      btnOkOnPress: () async{
                          await sharedPreferences.remove('user');
                          Navigator.of(navKey.currentContext!).pushNamedAndRemoveUntil(splashSc,
                                  (Route<dynamic> route) => false);
                          },).show();
                  },),

              ],),
          )
        ],),

    );
  }
}

