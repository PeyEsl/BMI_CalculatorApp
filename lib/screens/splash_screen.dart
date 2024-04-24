import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/widgets/base_widget.dart';
import 'package:bmi_calculator_app/screens/home_page_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePageScreen(),
        ),
      );
    });
  }

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return BaseWidget(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: _size.height * 0.2,
            ),
            const Image(
              height: 200,
              width: 200,
              image: AssetImage('assets/images/artanLogo.png'),
            ),
            const Spacer(),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 90,
                    fontFamily: 'FaridEnglish',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = pColorBlueLight,
                  ),
                ),
                // Solid text as fill.
                const Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 90,
                    fontFamily: 'FaridEnglish',
                    color: pColorBlue,
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'Calculator',
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'FaridEnglish',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = pColorBlueLight,
                  ),
                ),
                // Solid text as fill.
                const Text(
                  'Calculator',
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'FaridEnglish',
                    color: pColorBlue,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'Designed by',
              style: TextStyle(
                color: pColorBlueDarkLight,
                // fontWeight: FontWeight.bold,
                fontFamily: 'FaridEnglish',
                fontSize: 15,
              ),
            ),
            const Text(
              'Artan Co.',
              style: TextStyle(
                color: pColorBlue,
                // fontWeight: FontWeight.bold,
                fontFamily: 'FaridEnglish',
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
