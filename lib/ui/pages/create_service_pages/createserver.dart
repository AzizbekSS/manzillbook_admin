import 'package:flutter/material.dart';

import '../../../controller/util/padding/app_padding.dart';
import '../../../controller/util/route/animateroute.dart';
import '../../../controller/util/theme/main_color.dart';
import '../../widgets/app_widgets/button.dart';
import '../main_pages/home_page.dart';
import 'contacts_page.dart';
import 'createtilerow.dart';
import 'enter_service_main_infos.dart';
import 'other_services.dart';

class CreateServer extends StatefulWidget {
  const CreateServer({super.key});

  @override
  State<CreateServer> createState() => CreateServerState();
}

final list = [EnterServiceMainInfos(), ContactsPage(), OtherServices()];

int initialIndex = 0;

final PageController controller = PageController(initialPage: initialIndex);
bool is1stPast = false;
bool is2ndPast = false;
bool isLastPast = false;

class CreateServerState extends State<CreateServer> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: Dis.only(lr: 8, tb: 10),

          children: [
            CreateTileRow(
              index: initialIndex,
              is1stPast: is1stPast,
              is2ndPast: is2ndPast,
              isLastPast: isLastPast,
            ),
            SizedBox(
              height: h * .78,
              width: double.maxFinite,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    initialIndex = value;
                  });
                },
                controller: controller,
                children: list,
              ),
            ),
            SizedBox(height: h * .01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (initialIndex == 1) {
                      setState(() {
                        is1stPast = false;
                      });
                      controller.animateToPage(
                        0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    } else if (initialIndex == 2) {
                      setState(() {
                        is2ndPast = false;
                      });
                      controller.animateToPage(
                        1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                  child: Container(
                    height: h * .044,
                    width: w * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: mainColor, width: 1.2),
                    ),
                    child: Center(
                      child: Text(
                        'Previous',
                        style: TextStyle(color: mainColor),
                      ),
                    ),
                  ),
                ),
                Button(
                  h: h * 0.044,
                  onTap: () {
                    if (initialIndex == 0) {
                      setState(() {
                        is1stPast = true;
                      });
                      controller.animateToPage(
                        1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    } else if (initialIndex == 1) {
                      setState(() {
                        is2ndPast = true;
                      });
                      controller.animateToPage(
                        2,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    } else {
                      animateRightLeftNamed('home', context);
                    }
                  },
                  w: w * 0.2,
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
