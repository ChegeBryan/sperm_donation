import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sperm_donation/services/auth.dart';
import 'package:sperm_donation/services/user.dart';
import 'package:sperm_donation/ui/auth/screens/login.dart';
import 'package:sperm_donation/ui/auth/screens/register.dart';
import 'package:sperm_donation/ui/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Sperm Donation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/dashboard': (context) => AdminDashboard(),
        },
      ),
    );
  }
}
