import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/widgets/base_widget.dart';
import 'package:bmi_calculator_app/widgets/dropdown_widget.dart';
import 'package:bmi_calculator_app/widgets/number_picker_widget.dart';
import 'package:bmi_calculator_app/models/bmi_person_model.dart';
import 'package:bmi_calculator_app/screens/result_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Size _size;

  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  List<String> heightList = <String>['Height (inch)', 'Height (cm)'];
  List<String> weightList = <String>['Weight (ibs)', 'Weight (kg)'];

  Color _boxColor = pColorWhiteLight;

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
    _size = MediaQuery.of(context).size;
    return BaseWidget(
      body: SafeArea(
        child: SizedBox(
          height: _size.height,
          width: _size.width,
          child: SingleChildScrollView(
            child: Padding(
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            _boxColor = pColorBlue;
                            personGender = 'Male';
                          });
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: _size.height * 0.15,
                          width: _size.width * 0.4,
                          decoration: BoxDecoration(
                            color: pColorWhiteLight,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: personGender.isNotEmpty &&
                                      personGender == 'Male'
                                  ? _boxColor
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
                                const Text(
                                  'Male',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/male-avatar.jpg',
                                  width: 83,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _boxColor = pColorBlue;
                            personGender = 'Female';
                          });
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: _size.height * 0.15,
                          width: _size.width * 0.4,
                          decoration: BoxDecoration(
                            color: pColorWhiteLight,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: personGender.isNotEmpty &&
                                      personGender == 'Female'
                                  ? _boxColor
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
                                const Text(
                                  'Female',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/female-avatar.jpg',
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: _size.height * 0.3,
                    width: _size.width - 60,
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
                            Container(
                              width: _size.width * 0.35,
                              decoration: BoxDecoration(
                                color: pColorBlueLighter,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: NumberPickerWidget(
                                      initialValue: 1,
                                      maxValue: 9,
                                      onChanged: (newValue) {
                                        setState(() {
                                          personHeightFt = newValue;
                                          print('Foot value: $newValue');
                                        });
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    top: 60,
                                    child: Text(
                                      heightType.isNotEmpty &&
                                              heightType == 'Height (cm)'
                                          ? 'm'
                                          : 'ft',
                                      style: const TextStyle(
                                        color: pColorBlue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: _size.width * 0.35,
                              decoration: BoxDecoration(
                                color: pColorBlueLighter,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: NumberPickerWidget(
                                      initialValue: 1,
                                      maxValue: 99,
                                      onChanged: (newValue) {
                                        setState(() {
                                          personHeightIn = newValue;
                                          print('Inch value: $newValue');
                                        });
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    top: 60,
                                    child: Text(
                                      heightType.isNotEmpty &&
                                              heightType == 'Height (cm)'
                                          ? 'cm'
                                          : 'in',
                                      style: const TextStyle(
                                        color: pColorBlue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                      Container(
                        height: _size.height * 0.2,
                        width: _size.width * 0.4,
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
                              DropdownWidget(
                                list: weightList,
                                onChanged: (String? value) {
                                  setState(() {
                                    weightType = value!;
                                  });
                                  print('Selected weight: $value');
                                },
                              ),
                              const Spacer(),
                              Container(
                                width: _size.width * 0.2,
                                decoration: const UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    color: pColorBlue,
                                    width: 4,
                                  ),
                                ),
                                child: TextField(
                                  controller: weightController,
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
                      ),
                      Container(
                        height: _size.height * 0.2,
                        width: _size.width * 0.4,
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
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Age',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: _size.width * 0.2,
                                decoration: const UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    color: pColorBlue,
                                    width: 4,
                                  ),
                                ),
                                child: TextField(
                                  controller: ageController,
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (weightController.text.isNotEmpty &&
                          ageController.text.isNotEmpty) {
                        personWeight = int.parse(weightController.text);
                        personAge = int.parse(ageController.text);
                        if (heightType == 'Height (cm)' &&
                            weightType == 'Weight (kg)') {
                          personHeight = (personHeightFt * 100) + personHeightIn;
                          double bmiResult = calculateBMI(
                              personHeight, personWeight, 10000);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                bmiResult: bmiResult,
                              ),
                            ),
                          );
                        } else if (heightType == 'Height (inch)' &&
                            weightType == 'Weight (ibs)') {
                          personHeight = (personHeightFt * 12) + personHeightIn;
                          double bmiResult = calculateBMI(
                              personHeight, personWeight, 703);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                bmiResult: bmiResult,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(
                                child: Text(
                                    'The unit of height and weight do not match!'),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                              child: Text(
                                  'Weight or Height value is not entered!'),
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // گوشه‌های گرد
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: Container(
                      width: double.infinity,
                      // عرض کلید را به عرض صفحه تنظیم می‌کند
                      height: 50,
                      decoration: BoxDecoration(
                        color: pColorBlue, // استفاده از متغیر برای رنگ پس زمینه
                        borderRadius:
                            BorderRadius.circular(15.0), // گوشه‌های گرد
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
      ),
    );
  }

  String inchToCm(int foot, int inch) {
    int footToInch = foot * 12;
    int newInch = inch + footToInch;
    int height = (newInch * 2.54).round();
    return height.toString();
  }

  double calculateBMI(int height, int weight, int bmiType) {
    var result = double.parse(((weight / (height * height)) * bmiType).toStringAsFixed(2));
    return result;
  }
}
