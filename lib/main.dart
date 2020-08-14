import 'package:bmicalculator/pages/about.dart';
import 'package:bmicalculator/pages/analysis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          bodyText1: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/about': (context) => AboutPage(),
        '/analysis': (context) => AnalysisPage()
      },
    );
  }
}
