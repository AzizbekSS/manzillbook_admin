// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../controller/util/padding/app_padding.dart';
import '../../../controller/util/theme/main_color.dart';


class TimelineChild extends StatelessWidget {
  final String text;
  const TimelineChild({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    return Container(
      
      height: h*.4,
      padding: Dis.only(lr: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: mainColor.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
