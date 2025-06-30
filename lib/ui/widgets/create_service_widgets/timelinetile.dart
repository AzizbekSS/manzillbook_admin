// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../controller/util/theme/main_color.dart';


class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget child;

  const MyTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      endChild: child,
      alignment: TimelineAlign.center,
      indicatorStyle: IndicatorStyle(
        
        color: isPast ? mainColor : mainColor.withOpacity(0.3),
        indicator: CircleAvatar(
          backgroundColor: isPast ? mainColor : Colors.white,
          child: Icon(
            Icons.check_circle,
            color: isPast ? Colors.white : mainColor.withOpacity(0.3),
            size: 20,
          ),
        ),
      ),
      axis: TimelineAxis.horizontal,
      isFirst: isFirst,
      isLast: isLast,
      afterLineStyle: LineStyle(
        color: isPast ? mainColor : mainColor.withOpacity(0.3),
        thickness: 10,
      ),
        beforeLineStyle: LineStyle(
          color: isPast ? mainColor : mainColor.withOpacity(0.3),
          thickness: 10,
        ),
      
    );
  }
}
