import 'package:flutter/material.dart';

import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {

  final String bmiValue;
  final String bmiCategory;
  final String bmiAdvice;

  ResultsPage({@required this.bmiValue, @required this.bmiCategory, @required this.bmiAdvice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: sizeL),
              child: Text(
                'Your Result', 
                style: kYourResultTextTitle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardBackgroundColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      // 'normal',
                      '$bmiCategory',
                      style: kResultCategoryText
                    ),
                    Text(
                      '$bmiValue',
                      style: kBigNumberTextStyle,
                    ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: sizeS),
                        child: Text(
                          '$bmiAdvice',
                          style: kAdviceText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              title: 'RE-CALCULATE YOUR BMI', 
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}