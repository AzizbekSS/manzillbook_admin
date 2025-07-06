
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../controller/util/theme/main_color.dart';

class MyTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final ThemeData theme;
  final String hint;
  final IconData prefix;
  TextInputType? type;
  void Function()? onTap;
  bool? readOnly;

   MyTextFromField({
    super.key,
    required this.controller,
    required this.theme,
    required this.hint,
    required this.prefix,
    this.type,
    this.onTap,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly??false,
      onTap: onTap,
      keyboardType:type?? TextInputType.multiline,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey,),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: mainColor, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey, width: 1.2),
        ),
        prefixIcon: HugeIcon(icon: prefix, color: Colors.grey),
      ),
      validator: (v) => v == null || v.isEmpty ? "Malumotni kiriting" : null,
    );
  }
}