import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  const NumberPickerWidget({
    super.key,
    required this.initialValue,
    required this.maxValue,
    required this.onChanged,
  });

  final int initialValue;
  final int maxValue;
  final void Function(int) onChanged;

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  late int _currentIntValue;

  @override
  void initState() {
    super.initState();
    _currentIntValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
        value: _currentIntValue,
        minValue: 0,
        maxValue: widget.maxValue,
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
        onChanged: (value) {
          setState(() => _currentIntValue = value);
          widget.onChanged(value);
        });
  }
}
