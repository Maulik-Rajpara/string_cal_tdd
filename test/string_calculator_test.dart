import 'package:flutter_test/flutter_test.dart';
import 'package:string_cal_tdd/features/calculator/data/string_calculator.dart';

void main() {
  group('StringCalculator Tests', () {
    test('should return 0 for an empty string', () {
      final calculator = StringCalculator();
      expect(calculator.add(''), 0);
    });

    test('should return the number itself for a single number', () {
      final calculator = StringCalculator();
      expect(calculator.add('1'), 1);
    });

    test('should return the sum of two numbers', () {
      final calculator = StringCalculator();
      expect(calculator.add('1,5'), 6);
    });

    test('should return the sum of multiple numbers', () {
      final calculator = StringCalculator();
      expect(calculator.add('1,2,3'), 6);
    });

    test('should handle new lines as separators', () {
      final calculator = StringCalculator();
      expect(calculator.add('1\n2,3'), 6);
    });

    test('should support custom delimiters', () {
      final calculator = StringCalculator();
      expect(calculator.add('//;\n1;2'), 3);
    });

    test('should throw an exception for negative numbers', () {
      final calculator = StringCalculator();
      expect(() => calculator.add('1,-2,3'), throwsA(isA<FormatException>()));
    });

    test('should throw an exception for multiple negative numbers', () {
      final calculator = StringCalculator();
      expect(() => calculator.add('1,-2,-3'), throwsA(isA<FormatException>()));
    });
  });
}
