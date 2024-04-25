import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:flutter/widgets.dart';

class ProgressBarWidget extends StatelessWidget {
  ProgressBarWidget({super.key, required this.bmiResult});

  final double bmiResult;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double progressValue = 0.5;
    return Container(
      height: 20,
      width: size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              decoration: BoxDecoration(
                color: pColorBlueDark,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Container(
              decoration: BoxDecoration(
                color: pColorBlueDarkLight,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.3,
            child: Container(
              decoration: BoxDecoration(
                color: pColorBlueLight,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Slider(
            onChanged: (value) {},
            value: bmiResult,
            min: 0,
            max: 30,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            thumbColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
