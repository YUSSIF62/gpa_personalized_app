import 'package:flutter/material.dart';
import 'package:gpa_personalized_app/screens/forgetpassword.dart';
import 'package:gpa_personalized_app/screens/home_page.dart';
import 'package:gpa_personalized_app/screens/login_screen.dart';
import 'package:gpa_personalized_app/screens/signup_screen.dart';
import 'package:gpa_personalized_app/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signin': (context) => LoginScreen(),
        '/home': (context) => HomePageScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgetpassword': (context) => Forgetpassword()
        //
      },
    );
  }
}
