import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/auth/parts/form_bottom_text.dart';
import 'package:sperm_donation/ui/auth/parts/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginForm(),
              FormBottomText(
                message: "Don't have an account?",
                actionMessage: 'Create a new account',
                action: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
