import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/widgets/sub_pages_app_bar.dart';
import 'package:task/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:task/features/shimmer/profile/profile_text_shimmer.dart';

import '../../../../core/constants/styles/styles.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subPagesAppBar(title: tr("user_profile"), onPressed: ()
      {Navigator.of(context).pop();},color: bgColor),
      backgroundColor: bgColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24.0,bottom: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(tr("name"),style: TextStyles.textview16SemiBold.copyWith(color: black),),
                  const SizedBox(height: 16,),

                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return context.read<ProfileCubit>().loading == true ?
                          const ProfileTextShimmer(width: 80,):

                        Text(context.read<ProfileCubit>().profileResponse!.data!.user!.name!,
                          style: TextStyles.textview14Normal.copyWith(color: grey),);
  },
),
                  const SizedBox(height: 24,),
                  const Divider(color: dividerColor3,indent: 16,endIndent: 16,),
                  const SizedBox(height: 24,),
                  Text(tr("phone"),style: TextStyles.textview16SemiBold.copyWith(color: black),),
                  const SizedBox(height: 16,),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return context.read<ProfileCubit>().loading == true ?
                      const ProfileTextShimmer(width: 90,) :

                      Text(context.read<ProfileCubit>().profileResponse!.data!.user!.phone!,
                        style: TextStyles.textview14Normal.copyWith(color: grey),);

  },
),
                  const SizedBox(height: 24,),
                  const Divider(color: dividerColor3,indent: 16,endIndent: 16,),
                  const SizedBox(height: 24,),
                  Text(tr("email"),style: TextStyles.textview16SemiBold.copyWith(color: black),),
                  const SizedBox(height: 16,),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return context.read<ProfileCubit>().loading == true ?
                         const ProfileTextShimmer(width: 110,) :

                      Text(context.read<ProfileCubit>().profileResponse!.data!.user!.email!,
                        style: TextStyles.textview14Normal.copyWith(color: grey),);
                      },
                  ),
                  const SizedBox(height: 24,),
                  const Divider(color: dividerColor3,indent: 16,endIndent: 16,),
                  const SizedBox(height: 24,),
                  Text(tr("car_plate_num"),style: TextStyles.textview16SemiBold.copyWith(color: black),),
                  const SizedBox(height: 16,),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return context.read<ProfileCubit>().loading == true ?
                         const ProfileTextShimmer(width: 70,) :

                      Text(context.read<ProfileCubit>().profileResponse!.data!.user!.licensePlate!,
                        style: TextStyles.textview14Normal.copyWith(color: grey),);
                    },
                  ),
                  const SizedBox(height: 24,),
                  const Divider(color: dividerColor3,indent: 16,endIndent: 16,),
                ],),
            ),
          ],),
      ),
    );
  }
}