import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator_app/constants.dart';

class ContainerTextFieldWidget extends StatelessWidget {
  const ContainerTextFieldWidget({
    super.key,
    required this.size,
    required this.weightList,
    required this.controller,
    required this.sizedBox,
    required this.dropdownWidget,
  });

  final Size size;
  final List<String> weightList;
  final TextEditingController controller;
  final double sizedBox;
  final Widget? dropdownWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: pColorWhiteLight,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // رنگ سایه
            spreadRadius: 5, // شعاع انتشار
            blurRadius: 7, // شعاع ماتیته
            offset: const Offset(0, 3), // مکان سایه
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: sizedBox,
            ),
            dropdownWidget!,
            const Spacer(),
            Container(
              width: size.width * 0.2,
              decoration: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: pColorBlue,
                  width: 4,
                ),
              ),
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
