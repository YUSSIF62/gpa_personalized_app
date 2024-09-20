import 'package:flutter/material.dart';
import 'package:gpa_personalized_app/screens/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Goal Achiever',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
          headlineSmall: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.green),
          ),
          labelStyle: TextStyle(color: Colors.green),
        ),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
      ),
      home: SplashScreen(),
    );
  }
}
