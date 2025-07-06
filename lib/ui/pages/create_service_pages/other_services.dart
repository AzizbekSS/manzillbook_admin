import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:manzillbook_admin/ui/widgets/app_widgets/my_text_form_field.dart';

import '../../../controller/util/theme/main_color.dart';

class OtherServices extends StatefulWidget {
  const OtherServices({super.key});

  @override
  State<OtherServices> createState() => _OtherServicesState();
}

class _OtherServicesState extends State<OtherServices> {
  final TextEditingController _summaController = TextEditingController();
  final TextEditingController _starintWorkTimeController =
      TextEditingController();
  final TextEditingController _endingWorkTimeController =
      TextEditingController();

  final TextEditingController _dayOffController = TextEditingController();
  final List<String> _weekdays = [
    'Dushanba',
    'Seshanba',
    'Chorshanba',
    'Payshanba',
    'Juma',
    'Shanba',
    'Yakshanba',
  ];
  final List<String> _selectedDays = [];

  void _showPopupMenu() async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final selected = await showMenu<String>(
      surfaceTintColor: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(overlay.size.width, 450, 0, 0),
      items: _weekdays.map((day) {
        final isSelected = _selectedDays.contains(day);
        return PopupMenuItem<String>(
          value: day,
          child: Row(
            children: [
              Icon(
                isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(day, style: TextStyle(color: Colors.black)),
            ],
          ),
        );
      }).toList(),
    );

    if (selected != null) {
      setState(() {
        if (_selectedDays.contains(selected)) {
          _selectedDays.remove(selected);
        } else {
          _selectedDays.add(selected);
        }
        _dayOffController.text = _selectedDays.join(', ');
      });
      _showPopupMenu();
    }
  }

  void _selectTime(TextEditingController controller) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.black,
              hourMinuteTextColor: Colors.white,
              dialHandColor: mainColor,
              dialBackgroundColor: Colors.grey[800],
            ),
            colorScheme: ColorScheme.dark(
              primary: mainColor,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        controller.text = value.format(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h * 0.03),
              MyTextFromField(
                controller: _summaController,
                theme: theme,
                hint: 'Xizmatingiz narxini kiriting',
                prefix: HugeIcons.strokeRoundedDollarCircle,
              ),
              SizedBox(height: h * 0.03),
              MyTextFromField(
                readOnly: true,
                controller: _starintWorkTimeController,
                theme: theme,
                hint: 'Ish boshlash vaqtingizni kiriting',
                prefix: HugeIcons.strokeRoundedTime01,
                onTap: () {
                  _selectTime(_starintWorkTimeController);
                },
              ),
              SizedBox(height: h * 0.03),
              MyTextFromField(
                readOnly: true,
                controller: _endingWorkTimeController,
                theme: theme,
                hint: "Ish tugatish vaqtingizni kiriting",
                prefix: HugeIcons.strokeRoundedTime02,
                onTap: () {
                  _selectTime(_endingWorkTimeController);
                },
              ),
              SizedBox(height: h * 0.03),
              TextFormField(
                readOnly: true,
                keyboardType: TextInputType.number,
                controller: _dayOffController,
                onTap: _showPopupMenu,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () {},
                  ),
                  hintText: "Dam olish kunlaringizni kirinting",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey, width: 1.2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: mainColor, width: 1.2),
                  ),
                  prefixIcon: HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendarBlock01,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
