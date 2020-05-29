import 'dart:math';

class BMIBrain{

  final int height;
  final int weight;
  double _bmi;

  BMIBrain({this.height, this.weight});

  String calculateBMI(){
    _bmi = weight / pow(height / 100, 2);    
    return _bmi.toStringAsFixed(1);
  }

  String getCategory(){
    if(_bmi == null){
      String bmiString = calculateBMI();
      print('BMIBrain.getCategory() _bmi has been calculated: $bmiString');
    }
    if(_bmi < 18.5){
      return 'UNDERWEIGHT';
    } else if (_bmi < 24.9){
      return 'NORMAL';
    } else if (_bmi < 29.9){
      return 'OVERWEIGHT';
    } else {
      return 'DANGER';
    }
  }

  String getAdvice(){
    if(_bmi == null){
      String bmiString = calculateBMI();
      print('BMIBrain.getAdvice() _bmi has been calculated: $bmiString');
    }
    Map advice = {
      'UNDERWEIGHT': 'Your body weight is too low for your height. Eat more',
      'NORMAL': 'You have a normal body weight for your height. Good job!',
      'OVERWEIGHT': 'Your body weight is too high for your height. Eat less',
      'DANGER': 'Your body weight is way too high for your height. Please consult a doctor',
    };
    return advice[getCategory()];
  }
}
/*
Design notes: 
underweight (BMI less than 18.5)
normal weight (BMI between 18.5 & 24.9)
overweight (BMI between 25.0 & 29.9)
obese (BMI 30.0 and above)

a person who is 183cms tall is 1.83m tall (183cm / 100 = 1.83m).

Step1: Multiply your height in meters by itself (height^2).
Step2: Divide your weight in kilograms by the value calculated in step 1.

For example (pseudo code):
height = 183 cm
weight = 73 kg

heightInMeters = 183 / 100
bmi = weight / _heightInMeters * _heightInMeters
*/