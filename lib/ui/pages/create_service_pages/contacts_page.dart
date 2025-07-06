import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../controller/util/padding/app_padding.dart';
import '../../widgets/app_widgets/my_text_form_field.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _contactController2 = TextEditingController();
  final TextEditingController _socialController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: Dis.only(lr: 8, tb: 10),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: h * .05),
                  MyTextFromField(
                    type: TextInputType.phone,
                    controller: _contactController,
                    theme: theme,
                    hint: 'Aloqa uchun telefon raqam kiriting',
                    prefix: HugeIcons.strokeRoundedCall02,
                  ),
                  SizedBox(height: h * .05),
                  MyTextFromField(
                    type: TextInputType.phone,
                    controller: _contactController2,
                    theme: theme,
                    hint: "Aloqa uchun 2-telefon raqam kiriting",
                    prefix: HugeIcons.strokeRoundedCall02,
                  ),
                  SizedBox(height: h * .05),

                  MyTextFromField(
                    controller: _socialController,
                    theme: theme,
                    hint:
                        "Ijtimoiy tarmoqlari (Instagram, Telegram va boshqalar)",
                    prefix: HugeIcons.strokeRoundedInstagram,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
