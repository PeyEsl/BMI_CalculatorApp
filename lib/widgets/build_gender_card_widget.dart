import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';

class BuildGenderCardWidget extends StatelessWidget {
  const BuildGenderCardWidget(
      {super.key, required this.onTap, required this.size, required this.gender, required this.selectedGender,});

  final VoidCallback onTap;
  final Size size;
  final String gender;
  final String selectedGender;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: size.height * 0.15,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          color: pColorWhiteLight,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selectedGender == gender
                ? pColorBlue
                : pColorWhiteLight,
            width: 3,
          ),
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
              Text(
                gender == 'Male' ? 'Male' : 'Female',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Image.asset(
                gender == 'Male'
                    ? 'assets/images/male-avatar.jpg'
                    : 'assets/images/female-avatar.jpg',
                width: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
