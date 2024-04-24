import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            pColorWhiteLight,
            pColorWhiteDark,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        // appBar: appBar,
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
