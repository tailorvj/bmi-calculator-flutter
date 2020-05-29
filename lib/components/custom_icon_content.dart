import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CustomIconContent extends StatelessWidget {

  CustomIconContent({
    this.color, @required this.icon, @required this.text,
  });

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: sizeHUGE,
          color: kIconColor,
        ),
        SizedBox(
          height: sizeS,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: sizeL,
            color: color,
          ),
        ),
      ],
    );
  }
}