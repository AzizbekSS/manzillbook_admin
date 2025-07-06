import 'package:flutter/material.dart';

import '../../widgets/create_service_widgets/timeline_child.dart';
import '../../widgets/create_service_widgets/timelinetile.dart';

class CreateTileRow extends StatelessWidget {
  final int index;
  final bool is1stPast;
  final bool is2ndPast;
  final bool isLastPast;
  const CreateTileRow({
    super.key,
    required this.index,
    required this.is1stPast,
    required this.is2ndPast,
    required this.isLastPast,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * .1,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTimelineTile(
            isFirst: true,
            isLast: false,
            isPast: is1stPast,
            child: index == 0 ? TimelineChild(text: 'Main Infos') : Text(''),
          ),
          MyTimelineTile(
            isFirst: false,
            isLast: false,
            isPast: is2ndPast,
            child: index == 1 ? TimelineChild(text: 'Contacts') : Text(''),
          ),
          MyTimelineTile(
            isFirst: false,
            isLast: true,
            isPast: isLastPast,
            child: index == 2
                ? TimelineChild(text: 'Additional infos')
                : Text(''),
          ),
        ],
      ),
    );
  }
}
