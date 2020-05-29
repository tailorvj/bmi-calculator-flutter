import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({
    @required this.color,
    this.child
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        margin: EdgeInsets.all(sizeS),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(sizeM),
        ),
      );
  }
}
