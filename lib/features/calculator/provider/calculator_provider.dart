import 'package:flutter/material.dart';

import '../data/string_calculator.dart';

class CalculatorProvider with ChangeNotifier {
  String _input = '';
  String _result = '';
  String _errorMessage = '';

  String get input => _input;
  String get result => _result;
  String get errorMessage => _errorMessage;

  void setInput(String input) {
    _input = input;
  }

  void calculate() {
    _errorMessage = '';
    try {
      final calculator = StringCalculator();
      _result = 'Result: ${calculator.add(_input)}';
    } catch (e) {
      _errorMessage = e.toString();
      _result = '';
    }
    notifyListeners(); // Notify listeners about the result/error
  }
}
