// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../controller/util/padding/app_padding.dart';

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const RoleCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.22,
        width: w * 0.7,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: Dis.only(lr: 10, tb: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 3,
              offset: const Offset(5.0, 5.0),
            ),
          ],
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 32,
              child: Icon(icon, size: 36, color: Colors.white),
            ),
            SizedBox(height: h * .01),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: h * .01),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
