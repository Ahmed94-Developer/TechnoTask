import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/widgets/svg_handler.dart';
import 'package:task/features/login/presentation/cubit/login_cubit.dart';

import '../constants/colors/colors.dart';
import '../constants/styles/styles.dart';

class CustomTextField extends StatelessWidget{
  final TextEditingController controller;
  String? hintText;
  final String? icon;
  final bool obscure;
  final String? labelTxt;
  final String? fieldType;
  final TextInputType? textInputType;
  String ? Function(String?)? validation;
  String ? Function(String?)? onChange;
  CustomTextField({super.key, required this.controller,this.hintText,this.icon, required this.obscure,this.labelTxt,this.textInputType
    , this.validation,this.onChange,this.fieldType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return TextFormField(
          controller: controller,
          style: TextStyles.textview16Normal.copyWith(color: black,letterSpacing: -0.408),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          obscureText:fieldType == "pass" ? context.read<LoginCubit>().visible! :  obscure,
          keyboardType: textInputType,
          onChanged: onChange,
          decoration:  InputDecoration(

            errorStyle: TextStyles.textview16Normal.copyWith(color: fieldTxtColor,letterSpacing: -.16),
            alignLabelWithHint: true,
            focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))
                ,borderSide: BorderSide(color: fieldTxtColor)),
            suffixIcon: fieldType == "pass" ?  IconButton(onPressed: (){
                  context.read<LoginCubit>().setVisibility(visibility: context.read<LoginCubit>().visible!);
                }, icon: Icon(context.read<LoginCubit>().visible == true ? Icons.visibility_off_outlined
            : Icons.visibility_outlined ,color: fieldTxtColor,),) : const SizedBox(),

            prefixIcon: Container(
              width: 21,
                alignment: Alignment.center,
                child: customSvg(img: icon!, width: 20.0, height: 20.0)),
            hintText: hintText,
            hintStyle: TextStyles.textview16Normal.copyWith(color: fieldTxtColor,letterSpacing: -0.408)
            ,border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))
              ,borderSide: BorderSide(color: fieldTxtColor)),
            fillColor: white,filled: true
            ,enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))
              ,borderSide: BorderSide(color: fieldTxtColor)),
            errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))
                ,borderSide: BorderSide(color: fieldTxtColor)),
            contentPadding: const EdgeInsets.only(left: 9,right: 9,top: 0,bottom: 0),

            label: Text(labelTxt!,style: TextStyles.textview14Normal.copyWith(color: fieldTxtColor,) ,softWrap: true,),
          ),
          validator: validation,
        );
  },
));
  }

}