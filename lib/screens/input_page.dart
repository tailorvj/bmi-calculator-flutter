import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/constants.dart';

import 'results_page.dart';
import 'package:bmi_calculator/bmi_brain.dart';

import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/custom_icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

var cardBackgroundColor = kActiveCardBackgroundColor;
var heightSliderValue = 160.0;
int weight = 60;
int age = 50;

enum Gender {
  male,
  female,
}

Gender selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? kActiveCardBackgroundColor
                          : kInkActiveCardBackgroundColor,
                      child: CustomIconContent(
                        icon: FontAwesomeIcons.mars,
                        color: kReusableCardTextColor,
                        text: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardBackgroundColor
                          : kInkActiveCardBackgroundColor,
                      child: CustomIconContent(
                        icon: FontAwesomeIcons.venus,
                        color: kReusableCardTextColor,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: cardBackgroundColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kReusableCardTextStyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                heightSliderValue.toInt().toString(),
                                style: kBigNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kReusableCardTextStyle,
                                ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: kSliderInactiveColor,
                              activeTrackColor: kSliderActiveColor,
                              thumbColor: kThumbColor,
                              overlayColor: kSliderThemeOverlayColor,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: sizeM),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: sizeXL),
                            ),
                            child: Slider(
                            min: 120.0,
                            max: 240.0,
                            divisions: 200,
                            // inactiveColor: kSliderInactiveColor,
                            // activeColor: kSliderActiveColor,
                            value: heightSliderValue,
                            onChanged: (changedValue){
                              setState(() {
                                heightSliderValue = changedValue.round().toDouble();
                              });
                            },
                            ),
                          ),
                        ],),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: cardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kReusableCardTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,                            
                          children: <Widget>[
                          Text(
                            '$weight',
                            style: kBigNumberTextStyle,
                          ),
                          Text(
                            'kg',
                            style: kReusableCardTextStyle,
                          ),
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.expand_more,
                              onPressed: (){
                                // print('pressed the less button');
                                setState((){weight--;});
                                },
                            ),
                            SizedBox(width: sizeS),
                            RoundIconButton(
                              icon: Icons.expand_less,
                              onPressed: (){
                                // print('pressed the more button');
                                setState((){weight++;});
                                },
                            ),
                        ],),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: cardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kReusableCardTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,                            
                          children: <Widget>[
                          Text(
                            '$age',
                            style: kBigNumberTextStyle,
                          ),
                          Text(
                            'yrs',
                            style: kReusableCardTextStyle,
                          ),

                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.expand_more,
                              onPressed: (){
                                // print('pressed the less button');
                                setState((){age--;});
                                },
                            ),
                            SizedBox(width: sizeS,),
                            RoundIconButton(
                              icon: Icons.expand_less,
                              onPressed: (){
                                // print('pressed the more button');
                                setState((){age++;});
                                },
                            ),
                        ],),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE BMI',
            onTap: (){
              BMIBrain brain = BMIBrain(height: heightSliderValue.toInt(), weight: weight);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmiValue: brain.calculateBMI(), 
                      bmiCategory: brain.getCategory(), 
                      bmiAdvice: brain.getAdvice(),
                    ),),);
            },
          ),
        ],
      ),
    );
  }
}

