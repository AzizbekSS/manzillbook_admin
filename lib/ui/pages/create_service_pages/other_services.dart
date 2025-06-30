import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

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

      final TextEditingController _dayOffController=TextEditingController();
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
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        overlay.size.width, 
        80, 
        0,
        0,
      ),
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
              Text(day,style: TextStyle(color: Colors.white),),
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
              child: child!);
        }).then((value) {
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
            SizedBox(
              height: h * 0.03,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _summaController,
              decoration: InputDecoration(
                hintText: "Xizmatingiz narxini kiriting (so'mda)",
                hintStyle: TextStyle(color: theme.colorScheme.primary),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: mainColor,
                      width: 1.2,
                    )),
                prefixIcon: HugeIcon(
                    icon: HugeIcons.strokeRoundedDollar01,
                    color: theme.colorScheme.primary),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            TextFormField(
              readOnly: true,
              keyboardType: TextInputType.number,
              controller: _starintWorkTimeController,
              onTap: () {
                _selectTime(_starintWorkTimeController);
              },
              decoration: InputDecoration(
                hintText: "Ish boshlash vaqtingizni kirinting",
                hintStyle: TextStyle(color: theme.colorScheme.primary),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: mainColor,
                      width: 1.2,
                    )),
                prefixIcon: HugeIcon(
                    icon: HugeIcons.strokeRoundedTime02,
                    color: theme.colorScheme.primary),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            TextFormField(
              readOnly: true,
              keyboardType: TextInputType.number,
              controller: _endingWorkTimeController,
              onTap: () {
                _selectTime(_endingWorkTimeController);
              },
              decoration: InputDecoration(
                hintText: "Ish boshlash vaqtingizni kirinting",
                hintStyle: TextStyle(color: theme.colorScheme.primary),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: mainColor,
                      width: 1.2,
                    )),
                prefixIcon: HugeIcon(
                    icon: HugeIcons.strokeRoundedTimeSchedule,
                    color: theme.colorScheme.primary),
              ),
            ),  SizedBox(
              height: h*0.03,
            ),
               TextFormField(
             readOnly: true,
              keyboardType: TextInputType.number,
              controller: _dayOffController,
            
              decoration: InputDecoration(
                 suffixIcon: IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: _showPopupMenu,
            ),
                hintText: "Dam olish kunlaringizni kirinting",
                hintStyle: TextStyle(color: theme.colorScheme.primary),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: mainColor,
                      width: 1.2,
                    )),
                prefixIcon: HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendarBlock01,
                    color: theme.colorScheme.primary,),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
