import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function pressed;

  CustomIconButton({this.icon, this.pressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      shape: CircleBorder(),
      fillColor: buttonColor,
      // elevation: 5,
      child: Icon(icon),
      padding: EdgeInsets.all(15),
    );
  }
}
