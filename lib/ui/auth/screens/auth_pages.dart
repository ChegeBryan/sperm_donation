import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/auth/screens/login.dart';
import 'package:sperm_donation/ui/auth/screens/register_donor.dart';

class AuthPages extends StatelessWidget {
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        LoginScreen(),
        RegisterDonorScreen(),
      ],
    );
  }
}
