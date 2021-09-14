import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sperm_donation/models/user.dart';
import 'package:sperm_donation/services/auth.dart';
import 'package:sperm_donation/services/sperm_bank.dart';
import 'package:sperm_donation/services/user.dart';
import 'package:sperm_donation/ui/auth/screens/login.dart';
import 'package:sperm_donation/ui/auth/screens/register.dart';
import 'package:sperm_donation/ui/screens/add_sperm_bank_screen.dart';
import 'package:sperm_donation/ui/screens/dashboard.dart';
import 'package:sperm_donation/ui/screens/sperm_banks_list.dart';
import 'package:sperm_donation/util/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<User> _userPreferences = UserPrefences().getUser();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (create) => SpermBankProvider()),
      ],
      child: MaterialApp(
        title: 'Sperm Donation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _userPreferences,
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data!.email == null) {
                return LoginScreen();
              }
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(snapshot.data);
              return AdminDashboard();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/dashboard': (context) => AdminDashboard(),
          '/spermBanks': (context) => SpermBanksList(),
          '/addSpermBank': (context) => AddSpermBankScreen(),
        },
      ),
    );
  }
}
