import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/models/bmi_person_model.dart';
import 'package:bmi_calculator_app/widgets/base_widget.dart';
import 'package:bmi_calculator_app/widgets/progress_bar_widget.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.bmiList});

  final List<BMIPersonModel> bmiList;

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var result = getBmiResult(bmiList[0].bmiResult);
    return BaseWidget(
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text(
                    'Your Result',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: size.height * 0.4,
                    width: size.width - 60,
                    padding: const EdgeInsets.all(20.0),
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
                        const Text(
                          'Your BMI is:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          bmiList[0].bmiResult.toString(),
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const ProgressBarWidget(),
                        const Spacer(),
                        Text(
                          result.category,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: size.height * 0.25,
                    width: size.width - 60,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: pColorWhiteLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: pColorBlueLight,
                        width: 3,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          result.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(15.0),
                                ),
                                padding: const EdgeInsets.all(0),
                              ),
                              child: Container(
                                width: (size.width - 90) * 0.50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: pColorBlue,
                                  borderRadius:
                                      BorderRadius.circular(15.0),
                                ),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Full Details',
                                        style: TextStyle(
                                          color: pColorWhiteLight,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt_rounded,
                                        color: pColorWhiteLight,
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: pColorBlue, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          color: pColorBlue,
                          iconSize: 30,
                          padding: const EdgeInsets.all(15.0),
                          icon: const Icon(Icons.share_rounded),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: pColorBlue, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Phoenix.rebirth(context);
                          },
                          color: pColorBlue,
                          iconSize: 30,
                          padding: const EdgeInsets.all(15.0),
                          icon: const Icon(Icons.refresh_rounded),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BmiCategory getBmiResult(double bmi){
    for(var item in bmiCategory){
      if(item.lowRange <= bmi && item.highRange >= bmi){
        return item;
      }
    }
    return BmiCategory('', 0, 0, '');
  }
}
