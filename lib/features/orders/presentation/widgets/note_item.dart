import 'package:flutter/cupertino.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/styles/styles.dart';

class NoteItem extends StatelessWidget{
  final String note;

  NoteItem({required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: white,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 40),
      child: Text(note,style: TextStyles.textview14Normal.copyWith(color: grey),),

    );
  }

}