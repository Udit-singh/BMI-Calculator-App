import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  // const BMICard({
  //   Key key,
  // }) : super(key: key);
  BMICard({@required this.colour, this.cardChild, this.pressed});
  final Color colour;
  final Widget cardChild;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(1.49),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
