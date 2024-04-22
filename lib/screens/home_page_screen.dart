import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/widgets/base_widget.dart';
import 'package:bmi_calculator_app/widgets/dropdown_widget.dart';
import 'package:bmi_calculator_app/widgets/number_picker_widget.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});

  late Size _size;
  List<String> heightList = <String>['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return BaseWidget(
      body: SafeArea(
        child: SizedBox(
          height: _size.height,
          width: _size.width,
          child: Column(
            children: [
              const Text(
                'BMI Calculator',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: _size.height * 0.15,
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
                    onTap: () {},
                    child: Container(
                      height: _size.height * 0.15,
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
              const Spacer(),
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
                    DropdownWidget(list: heightList),
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
                          child: const Stack(
                            children: [
                              Center(
                                child: NumberPickerWidget(),
                              ),
                              Positioned(
                                right: 25,
                                top: 60,
                                child: Text(
                                  'ft',
                                  style: TextStyle(
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
                          child: const Stack(
                            children: [
                              Center(
                                child: NumberPickerWidget(),
                              ),
                              Positioned(
                                right: 25,
                                top: 60,
                                child: Text(
                                  'in',
                                  style: TextStyle(
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
                    const Center(
                      child: Text('5 feet 3 inches (160 cm)', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // const SizedBox(
              //   height: 25,
              // ),
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
                    child: const Center(
                      child: Text('ali'),
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
                    child: const Center(
                      child: Text('ali'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // const SizedBox(
              //   height: 35,
              // ),
              ElevatedButton(
                onPressed: () {},
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
    );
  }
}
