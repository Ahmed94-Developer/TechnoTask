import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/constants/screens/screens.dart';
import 'package:task/core/constants/styles/styles.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/image_handler.dart';
import 'package:task/core/widgets/sub_pages_app_bar.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/language/presentation/widgets/language_item.dart';
import 'package:task/injection_container/injection_container.dart';
import 'package:task/main.dart';
import '../cubit/language_cubit.dart';


class LanguageScreen extends StatefulWidget {
   LanguageScreen({super.key, this.type});
   String? type;



  @override
  State<LanguageScreen> createState()=> _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  void initState() {
    context.read<LanguageCubit>().fToast.init(context);
    context.read<LanguageCubit>().setLanguage();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: white),

          child:  SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 widget.type == 'languageSc' ? const SizedBox(height: 35,) : subPagesAppBar(title: tr('language')
                      , onPressed: (){
                        Navigator.of(context).pop();
                      }, color: white),
                  Container(
                      alignment: Alignment.center,
                      child: customSvg(img: langLogo, width: 213.0, height: 213.0)),
                  const SizedBox(height: 16,),
                  Text(tr("select_lang"),style: TextStyles.textview16Bold.copyWith(color: black),),
                  const SizedBox(height: 16,),
                  Text(tr("lang_desc" ),style: TextStyles.textview14Normal.copyWith(color: grey)
                    ,textAlign: TextAlign.center,),
                  const SizedBox(height: 29,),
                  BlocBuilder<LanguageCubit, LanguageState>(
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.only(left: 16.0,right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LanguageItem(onTap: ()async{
                              context.read<LanguageCubit>().selectedLanguage(selected: 'ar');
                              await navKey.currentState!.context.setLocale(const Locale('ar'));
                            }
                              ,color: context.read<LanguageCubit>().selectedLang == 'ar' ? lightGreen : langBtnColor
                              ,langImg: arLogo,
                              langTxtColor:context.read<LanguageCubit>().selectedLang == 'ar' ? black : grey,
                              langType: "العربية",
                              borderColor: context.read<LanguageCubit>().selectedLang == 'ar' ? darkGreen : langBtnColor,),
                            const SizedBox(width: 16,),
                            LanguageItem(onTap: ()async{
                              context.read<LanguageCubit>().selectedLanguage(selected: 'en');
                              await navKey.currentState!.context.setLocale(const Locale('en'));
                            }
                              ,color: context.read<LanguageCubit>().selectedLang == 'en' ? lightGreen : langBtnColor
                              ,langImg: enLogo,
                              langTxtColor: context.read<LanguageCubit>().selectedLang == 'en' ? black : grey,
                              langType: "English",
                              borderColor: context.read<LanguageCubit>().selectedLang == 'en' ? darkGreen : langBtnColor,),

                          ],),
                      );
                    },
                  ),
                  const SizedBox(height: 16,)
                ],
              ),
          ),
          ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(top: 10,bottom: 29,left: 16,right: 16),
          height: 85,
          decoration: BoxDecoration(
              color: white,
              boxShadow: [BoxShadow(blurRadius: 9.5,color: grey.withOpacity(.22),spreadRadius: 0.7)]
          ),
          child:
          widget.type == 'languageSc' ?
          CustomButton(btnName: tr("next"),
            onPressed: ()async{
              await sharedPreferences.setBool('lang', true);
              Navigator.of(navKey.currentContext!).pushReplacementNamed(login);
            },) : CustomButton(btnName: tr("save"),onPressed: (){
              context.read<LanguageCubit>().showToast();
            Navigator.of(navKey.currentContext!).pushNamedAndRemoveUntil(splashSc,
                    (Route<dynamic> route) => false);
          },)

          ,
        ),
    ));
  }
}