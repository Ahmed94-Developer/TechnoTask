import 'package:flutter/cupertino.dart';
import 'package:task/features/shimmer/settings/reviews_item_shimmer.dart';

class ReviewsShimmerList extends StatelessWidget{
  const ReviewsShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 8,
        itemBuilder: (context,index)=>const ReviewsItemShimmer());
  }

}