import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/widgets/number_picker_widget.dart';

class ContainerNumberPickerWidget extends StatelessWidget {
  const ContainerNumberPickerWidget({
    super.key,
    required this.size,
    required this.initialValue,
    required this.maxValue,
    required this.onChanged,
    required this.heightType,
  });

  final Size size;
  final int initialValue;
  final int maxValue;
  final void Function(int) onChanged;
  final String heightType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.35,
      decoration: BoxDecoration(
        color: pColorBlueLighter,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Center(
            child: NumberPickerWidget(
              initialValue: initialValue,
              maxValue: maxValue,
              onChanged: onChanged,
            ),
          ),
          Positioned(
            right: 17,
            top: 60,
            child: Text(
              heightType,
              style: const TextStyle(
                color: pColorBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
