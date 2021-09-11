import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/auth/screens/login.dart';

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
      ],
    );
  }
}
