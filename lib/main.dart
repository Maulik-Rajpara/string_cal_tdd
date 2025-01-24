import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_cal_tdd/core/utils/app_strings.dart';
import 'package:string_cal_tdd/features/calculator/presentation/screen/calculator_screen.dart';

import 'features/calculator/provider/calculator_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}

