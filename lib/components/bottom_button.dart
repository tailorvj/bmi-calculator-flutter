import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;

  BottomButton({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kCalculateButtonTextStyle,
          ),
        ),
        width: double.infinity,
        height: sizeHUGE,
        color: kBottomBarColor,
        margin: EdgeInsets.only(top: sizeS),
        padding: EdgeInsets.only(bottom: sizeS),
      ),
    );

  }
}