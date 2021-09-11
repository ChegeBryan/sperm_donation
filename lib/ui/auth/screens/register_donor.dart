import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/auth/parts/form_bottom_text.dart';
import 'package:sperm_donation/ui/auth/parts/register_donor_form.dart';

class RegisterDonorScreen extends StatefulWidget {
  @override
  _RegisterDonorScreenState createState() => _RegisterDonorScreenState();
}

class _RegisterDonorScreenState extends State<RegisterDonorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RegisterDonorForm(),
                FormBottomText(
                  message: 'Are you a recipient? Swipe right',
                  actionMessage: 'Create a recipient account',
                  swipeTo: RegisterDonorScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
