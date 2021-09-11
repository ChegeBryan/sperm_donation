import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/auth/parts/form_bottom_text.dart';
import 'package:sperm_donation/ui/auth/parts/register_recipient_form.dart';

class RegisterRecipientScreen extends StatefulWidget {
  const RegisterRecipientScreen({Key? key}) : super(key: key);

  @override
  _RegisterRecipientScreenState createState() =>
      _RegisterRecipientScreenState();
}

class _RegisterRecipientScreenState extends State<RegisterRecipientScreen> {
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
                RegisterRecipientForm(),
                FormBottomText(
                  message: 'Are you an admin? Swipe right',
                  actionMessage: 'Create an admin account',
                  swipeTo: null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
