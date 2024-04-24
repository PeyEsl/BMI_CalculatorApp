import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/models/bmi_person_model.dart';
import 'package:bmi_calculator_app/widgets/base_widget.dart';
import 'package:bmi_calculator_app/widgets/dropdown_widget.dart';
import 'package:bmi_calculator_app/widgets/number_picker_widget.dart';
import 'package:bmi_calculator_app/widgets/build_gender_card_widget.dart';
import 'package:bmi_calculator_app/widgets/container_number_picker_widget.dart';
import 'package:bmi_calculator_app/widgets/container_text_field_widget.dart';
import 'package:bmi_calculator_app/screens/result_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Size size;

  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  List<String> heightList = <String>['Height (inch)', 'Height (cm)'];
  List<String> weightList = <String>['Weight (ibs)', 'Weight (kg)'];

  String personGender = '';
  String heightType = 'Height (inch)';
  String weightType = 'Weight (ibs)';
  int personWeight = 0;
  int personHeightFt = 1;
  int personHeightIn = 1;
  int personHeight = 0;
  int personAge = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildGenderCardWidget(
                      onTap: () {
                        setState(() {
                          personGender = 'Male';
                        });
                      },
                      size: size,
                      gender: 'Male',
                      selectedGender: personGender,
                    ),
                    BuildGenderCardWidget(
                      onTap: () {
                        setState(() {
                          personGender = 'Female';
                        });
                      },
                      size: size,
                      gender: 'Female',
                      selectedGender: personGender,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: size.height * 0.3,
                  width: size.width - 60,
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
                  child: Column(
                    children: [
                      DropdownWidget(
                        list: heightList,
                        onChanged: (String? value) {
                          setState(() {
                            heightType = value!;
                          });
                          print('Selected value: $value');
                        },
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ContainerNumberPickerWidget(
                            onChanged: (newValue) {
                              setState(() {
                                personHeightFt = newValue;
                                print('Foot value: $newValue');
                              });
                            },
                            size: size,
                            initialValue: 1,
                            maxValue: 9,
                            heightType: heightType.isNotEmpty &&
                                    heightType == 'Height (cm)'
                                ? 'm'
                                : 'ft',
                          ),
                          ContainerNumberPickerWidget(
                            onChanged: (newValue) {
                              setState(() {
                                personHeightIn = newValue;
                                print('Inch value: $newValue');
                              });
                            },
                            size: size,
                            initialValue: 1,
                            maxValue: 99,
                            heightType: heightType.isNotEmpty &&
                                    heightType == 'Height (cm)'
                                ? 'cm'
                                : 'in',
                          ),
                        ],
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          '$personHeightFt ${heightType.isNotEmpty && heightType == 'Height (cm)' ? 'meter' : 'feet'} $personHeightIn ${heightType.isNotEmpty && heightType == 'Height (cm)' ? 'centimeters' : 'inches'} ${heightType.isNotEmpty && heightType == 'Height (cm)' ? '' : '(${inchToCm(personHeightFt, personHeightIn)} cm)'}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerTextFieldWidget(
                      size: size,
                      weightList: weightList,
                      controller: weightController,
                      sizedBox: 0,
                      dropdownWidget: DropdownWidget(
                        list: weightList,
                        onChanged: (String? value) {
                          setState(() {
                            weightType = value!;
                          });
                          print('Selected weight: $value');
                        },
                      ),
                    ),
                    ContainerTextFieldWidget(
                      size: size,
                      weightList: weightList,
                      controller: ageController,
                      sizedBox: 10,
                      dropdownWidget: const Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // گوشه‌های گرد
                    ),
                    padding: const EdgeInsets.all(0),
                  ),
                  child: Container(
                    width: double.infinity,
                    // عرض کلید را به عرض صفحه تنظیم می‌کند
                    height: 50,
                    decoration: BoxDecoration(
                      color: pColorBlue, // استفاده از متغیر برای رنگ پس زمینه
                      borderRadius: BorderRadius.circular(15.0), // گوشه‌های گرد
                    ),
                    child: const Center(
                      child: Text(
                        'Calculate BMI',
                        style: TextStyle(
                          color: pColorWhiteLight,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String inchToCm(int foot, int inch) {
    int footToInch = foot * 12;
    int newInch = inch + footToInch;
    int height = (newInch * 2.54).round();
    return height.toString();
  }

  void calculateBMI() {
    if (weightController.text.isEmpty || ageController.text.isEmpty) {
      showSnackBar('Weight or Height value is not entered!');
      return;
    }

    personWeight = int.parse(weightController.text) ?? 0;
    personAge = int.parse(ageController.text) ?? 0;

    heightType == 'Height (cm)' && weightType == 'Weight (kg)'
        ? personHeight = (personHeightFt * 100) + personHeightIn
        : personHeight = (personHeightFt * 12) + personHeightIn;

    if (heightType == 'Height (cm)' && weightType != 'Weight (kg)' ||
        heightType != 'Height (cm)' && weightType == 'Weight (kg)') {
      showSnackBar('The unit of height and weight do not match!');
      return;
    }

    double bmiResult = double.parse(
        ((personWeight / (personHeight * personHeight)) *
                (heightType == 'Height (cm)' && weightType == 'Weight (kg)'
                    ? 10000
                    : 703))
            .toStringAsFixed(2));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmiResult: bmiResult,
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(message),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
