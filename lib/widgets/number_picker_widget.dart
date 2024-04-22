import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  const NumberPickerWidget({super.key});

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {

  int _currentIntValue = 1;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: _currentIntValue,
      minValue: 0,
      maxValue: 9,
      haptics: true,
      textStyle: const TextStyle(
        fontSize: 20,
      ),
      decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(
          color: pColorBlue,
          width: 2,
        )),
      ),
      selectedTextStyle: const TextStyle(
        color: pColorBlue,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (value) => setState(() => _currentIntValue = value),
    );
  }
}
