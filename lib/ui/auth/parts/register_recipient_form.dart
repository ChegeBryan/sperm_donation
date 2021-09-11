import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class RegisterRecipientForm extends StatefulWidget {
  const RegisterRecipientForm({Key? key}) : super(key: key);

  @override
  _RegisterRecipientFormState createState() => _RegisterRecipientFormState();
}

class _RegisterRecipientFormState extends State<RegisterRecipientForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            children: [
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                ),
                textAlignVertical: TextAlignVertical.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  } else if (isEmail(value)) {
                    return 'Provide a valid email';
                  }
                  return null;
                },
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
              TextFormField(
                controller: _password,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outlined),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                ),
                obscureText: true,
                textAlignVertical: TextAlignVertical.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a password';
                  }
                  return null;
                },
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
              TextFormField(
                controller: _confirmPassword,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outlined),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                ),
                obscureText: true,
                textAlignVertical: TextAlignVertical.center,
                validator: (value) {
                  if (value != _password.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
