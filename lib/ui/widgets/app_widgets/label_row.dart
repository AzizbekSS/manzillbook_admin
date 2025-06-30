import 'package:flutter/material.dart';



class LabelRow extends StatelessWidget {
  final String label;
  void Function()? onTap;

  LabelRow({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(15, 35),
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
            Text(
              'All',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ]),
        )
      ],
    );
  }
}
