// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../controller/util/padding/app_padding.dart';
import '../../../controller/util/theme/main_color.dart';


class ServiceCard extends StatelessWidget {
  final String serviceName;
  final int price;

  const ServiceCard({
    super.key,
    required this.price,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: Dis.all(5),
       margin: Dis.only(right: 10),
      height: h * .6,
        width: w * 0.4,
           decoration: BoxDecoration(
          
          color: mainColor.withOpacity(.17),
          borderRadius: BorderRadius.circular(15),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/dentist.jpg',
              fit: BoxFit.cover,
              height: h * 0.2,
                  width: w * 0.4,
            ),
          ),
          Text(
            serviceName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$price sum",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
