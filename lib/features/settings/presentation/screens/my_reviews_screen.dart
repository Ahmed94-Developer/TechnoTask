import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app_router.dart';
import 'package:task/core/constants/colors/colors.dart';
import 'package:task/core/widgets/sub_pages_app_bar.dart';
import 'package:task/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:task/features/settings/presentation/widgets/my_review_item.dart';
import 'package:task/features/shimmer/settings/reviews_shimmer_list.dart';

import '../../../../core/constants/styles/styles.dart';

class MyReviewsScreen extends StatefulWidget {
  const MyReviewsScreen({super.key});


  @override
  State<MyReviewsScreen> createState() => _MyRatingsScreenState();

}

class _MyRatingsScreenState extends State<MyReviewsScreen> {

  @override
  void initState() {
    context.read<SettingsCubit>().getReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: subPagesAppBar(title: tr("my_reviews"), onPressed: () {
        Navigator.of(context).pop();
      }, color: bgColor),

      body: SizedBox(
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return context.read<SettingsCubit>().reviewLoading == true ?
              const ReviewsShimmerList() :
            (context.read<SettingsCubit>().reviewsResponse == null ||
                context.read<SettingsCubit>().reviewsResponse!.data == null) ?
                Center(child: Text('Representative not found.',style:
                TextStyles.textview15SemiBold.copyWith(color: black),),) :
              ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                itemBuilder: (context, index) => MyReviewItem());
          },
        ),
      ),
    );
  }
}