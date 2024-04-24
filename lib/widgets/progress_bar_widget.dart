import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: pColorBlueDarkLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const LinearProgressIndicator(
          value: 0.6,
          backgroundColor: pColorBlueLight,
          valueColor:
          AlwaysStoppedAnimation(pColorBlueDark),
        ),
      ),
    );
  }
}
