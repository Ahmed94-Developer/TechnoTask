import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/images/images.dart';
import '../../../../core/widgets/svg_handler.dart';

class SplashWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                darkGreen,
                white],
                  stops: [0.0, 1.0],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated
              )),
          child: customSvg(img: logo, width: 148.0, height: 222.9)

      ),
    );
  }

}