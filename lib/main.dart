import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/auth/screens/login.dart';
import 'package:sperm_donation/ui/auth/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sperm Donation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen()
      },
    );
  }
}
