import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors/colors.dart';

class ProfileTextShimmer extends StatelessWidget{
  const ProfileTextShimmer({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(baseColor: grey
        , highlightColor: white, child: Container
          ( width: width,height: 8.0,
          decoration:  BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10))
              ,color: grey.withOpacity(.52) ),));
  }

}