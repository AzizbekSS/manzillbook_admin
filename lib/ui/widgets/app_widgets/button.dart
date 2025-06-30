// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../controller/util/theme/main_color.dart';

class Button extends StatelessWidget {
  final double h;
  final double w;
  final Widget child;
  final void Function() onTap;

  const Button({
    super.key,
    required this.child,
    required this.h,
    required this.onTap,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: mainColor,
      borderRadius: BorderRadius.circular(10),
      radius: 20,
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(15),
      
        ),
        child: Center(child: child),
        
      ),
    );
  }
}
