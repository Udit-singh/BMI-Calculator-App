import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: Text("About BMI Calculator",
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
        // backgroundColor: Colors.deepPurple[900],
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
    );
  }
}
