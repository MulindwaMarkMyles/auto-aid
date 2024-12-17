import 'package:auto_aid/pages/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Aid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(42, 75, 160, 1),
          brightness: Brightness.light,
          primary: Colors.white,
          secondary: Color.fromRGBO(42, 75, 160, 1),
        ),
        useMaterial3: true,
      ),
      home: const OnBoarding(),
    );
  }
}
