import 'package:flutter/cupertino.dart';

class ImageHandlerWidget extends StatelessWidget{
  final String img;
  final double width;
  final double height;

  const ImageHandlerWidget({super.key, required this.img,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(img,width: width,height: height,alignment: Alignment.center,fit: BoxFit.cover,);
  }

}