import 'dart:math';

class CalculateBrain {
  final int weight;
  final int height;

  double _bmi;

  CalculateBrain({this.height,this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal Body weight. Try to exerise more';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight. Good job';
    } else {
      return 'You have lower than normal Body Weight. Can eat more';
    }
  }

} 