// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manzillbook_admin/controller/util/theme/main_color.dart';
import 'package:manzillbook_admin/ui/widgets/app_widgets/my_text_form_field.dart';

import '../../../controller/util/padding/app_padding.dart';

class EnterServiceMainInfos extends StatefulWidget {
  const EnterServiceMainInfos({super.key});

  @override
  State<EnterServiceMainInfos> createState() => _EnterServiceMainInfosState();
}

class _EnterServiceMainInfosState extends State<EnterServiceMainInfos> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  XFile? _logo;
  List<XFile> _images = [];

  Future<void> _pickLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _logo = image;
      });
    }
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        _images = images;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Dis.only(lr: 8, tb: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h * .02),
                MyTextFromField(
                  controller: _nameController,
                  theme: theme,
                  hint: "Service nomini kiriting",
                  prefix: HugeIcons.strokeRoundedOffice,
                ),
                SizedBox(height: h * .03),
                MyTextFromField(
                  controller: _aboutController,
                  theme: theme,
                  hint: "Service haqida ma'lumot kiriting",
                  prefix: HugeIcons.strokeRoundedInformationSquare,
                ),
                SizedBox(height: h * .03),
                MyTextFromField(
                  controller: _addressController,
                  theme: theme,
                  hint: 'Service manzili',
                  prefix: HugeIcons.strokeRoundedLocation01,
                ),
                SizedBox(height: h * .03),
                Text(
                  "Manzil rasmlari",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: h * .1,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: _pickImages,
                        child: Container(
                          width: h * .1,
                          height: w * .1,
                          decoration: BoxDecoration(
                            color: mainColor.withOpacity(0.17),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedImageUpload,
                            color: Colors.black,
                            size: 26,
                          ),
                        ),
                      ),
                      ..._images.map(
                        (img) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(img.path),
                              width: h * .1,
                              height: w * .1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





                // Center(
                //   child: ElevatedButton.icon(
                //     style: ElevatedButton.styleFrom(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 40, vertical: 16),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(16),
                //         ),
                //         backgroundColor: mainColor),
                //     icon: const Icon(
                //       Icons.check_circle_outline,
                //       color: Colors.white,
                //     ),
                //     label: const Text(
                //       "Saqlash",
                //       style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     ),
                //     onPressed: () {},
                //   ),
                // ),