import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_cal_tdd/core/utils/app_strings.dart';

import '../../provider/calculator_provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Consumer<CalculatorProvider>(
              builder: (context, calculatorProvider, child) {
                return TextField(
                  controller: TextEditingController(text: calculatorProvider.input),
                  decoration: const InputDecoration(
                    labelText: AppStrings.enterName,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (input) {
                    calculatorProvider.setInput(input);
                  },
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(

              onPressed: () {
                context.read<CalculatorProvider>().calculate();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            Consumer<CalculatorProvider>(
              builder: (context, calculatorProvider, child) {
                return calculatorProvider.errorMessage.isNotEmpty
                    ? Text(
                  'Error: ${calculatorProvider.errorMessage}',
                  style: const TextStyle(color: Colors.red),
                )
                    : Text(
                  calculatorProvider.result,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
