import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: kIconColor,
        ),
      onPressed: onPressed,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: sizeXXL,
        height: sizeXXL,
      ),
      shape: CircleBorder(),
      fillColor: kReusableCardTextColor,
    );
  }
}