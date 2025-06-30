import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../ui/pages/main_pages/home_page.dart';


void animateBottomTop(Widget child, BuildContext context) {
  Navigator.push(
    context,
    PageTransition(
      childCurrent: HomePage(),

      type: PageTransitionType.bottomToTopJoined,
      // alignment: Alignment(100, 10),
      child: child,
    ),
  );
}

void animateRightLeft(Widget child, BuildContext context) {
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.rightToLeft,
      child: child,
    ),
  );
}

void animateRightLeftNamed(String child, BuildContext context) {
  context.pushNamedTransition(
      routeName: child, type: PageTransitionType.rightToLeft);
}

void goBack(BuildContext context) {
  Navigator.pop(context);
}
