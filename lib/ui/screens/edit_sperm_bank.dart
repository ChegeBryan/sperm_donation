import 'package:flutter/material.dart';
import 'package:sperm_donation/ui/screens/parts/edit_sperm_bank_form.dart';

class EditSpermBankScreen extends StatefulWidget {
  const EditSpermBankScreen({Key? key}) : super(key: key);

  @override
  _EditSpermBankScreenState createState() => _EditSpermBankScreenState();
}

class _EditSpermBankScreenState extends State<EditSpermBankScreen> {
  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Sperm Bank'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EditSpermBankForm(
          id: _args['id'],
          name: _args['name'],
          location: _args['location'],
        ),
      ),
    );
  }
}
