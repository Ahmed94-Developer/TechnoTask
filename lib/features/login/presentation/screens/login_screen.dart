import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/constants/images/images.dart';
import 'package:task/core/constants/screens/screens.dart';
import 'package:task/core/constants/size_config/dimensions.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_text_field.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/login/domain/entities/login_params.dart';
import 'package:task/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/constants/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState>formKey = GlobalKey();

  @override
  void initState() {
    context.read<LoginCubit>().fToast!.init(context);
    context.read<LoginCubit>().checkInternetConnectivity();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 113),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) ,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Center(child: customSvg(img: loginLogo, width: 109.0, height: 139.0,)),
                const SizedBox(height: 16,),
                Center(child: Text(tr("login"),style: TextStyles.textview16Bold.copyWith(color: black,),)),
                const SizedBox(height: 16,),
                Center(child: Text(tr("insert_your_login",),style: TextStyles.textview15SemiBold.copyWith(color: grey),)),
                const SizedBox(height: 24,),
                Container(
                    margin: const EdgeInsets.only(left: 16,right: 16),
                    child: Text(tr("email"),style: TextStyles.textview14SemiBold.copyWith(color: black),)),
                const SizedBox(height: 12,),

                Container(
                    margin: const EdgeInsets.only(left: 16,right: 16),
                    child: CustomTextField(controller: mailController,
                      obscure: false,
                      icon: sms,labelTxt: tr("insert_email"),
                      fieldType: "",validation: (String? val){
                      if(val!.isEmpty){
                        return tr("this_field_required");
                      }else {
                        return null;
                      }
                      },)),

                const SizedBox(height: 16,),
                Container(
                    margin: const EdgeInsets.only(left: 16,right: 16),
                    child: Text(tr("password"),style: TextStyles.textview14SemiBold.copyWith(color: black),)),
                const SizedBox(height: 12,),
                Container(
                    margin: const EdgeInsets.only(left: 16,right: 16),
                    child: CustomTextField(
                      controller: passwordController, obscure: true,
                      icon: lock,labelTxt: tr("insert_password"),
                      fieldType: "pass",validation: (String? val){
                        if(val!.isEmpty){
                          return tr("this_field_required");
                        }else {
                          return null;
                        }
                    },)),
                const SizedBox(height: 32,),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 16,right: 16),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return context.read<LoginCubit>().loading == true ?
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Center(child: CircularProgressIndicator(color: btnColor,),),) :
                          CustomButton(btnName: tr("sign_in"),onPressed: (){
                            if(formKey.currentState!.validate()){
                              context.read<LoginCubit>().
                              setLogin(params: LoginParams(email: mailController.text,
                                  password: passwordController.text));
                            }
                    },);
              },
            ))

            ],),
          ),
        ),
      ),
    );
  }
}