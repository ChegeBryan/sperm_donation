import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/screens/parts/add_sperm_bank_form.dart';

class AddSpermBankScreen extends StatefulWidget {
  const AddSpermBankScreen({Key? key}) : super(key: key);

  @override
  _AddSpermBankScreenState createState() => _AddSpermBankScreenState();
}

class _AddSpermBankScreenState extends State<AddSpermBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sperm Bank'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddSpermBankForm(),
      ),
    );
  }
}
