import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sperm_donation/services/sperm_bank.dart';

class EditSpermBankForm extends StatefulWidget {
  final String? name;
  final String? location;
  final int? id;

  const EditSpermBankForm({Key? key, this.id, this.name, this.location})
      : super(key: key);

  @override
  _EditSpermBankFormState createState() => _EditSpermBankFormState();
}

class _EditSpermBankFormState extends State<EditSpermBankForm> {
  Map<String, dynamic> errors = {};

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _name;
  late TextEditingController _location;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.name);
    _location = TextEditingController(text: widget.location);
  }

  @override
  void dispose() {
    _name.dispose();
    _location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SpermBankProvider manageSpermBank = Provider.of<SpermBankProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _name,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.local_hospital),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
            ),
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter sperm bank name';
              } else if (errors.containsKey('name_error')) {
                return errors['name_error'];
              }
              return null;
            },
            onChanged: (value) {
              errors.remove('name_error');
            },
          ),
          Padding(padding: const EdgeInsets.all(8.0)),
          TextFormField(
            controller: _location,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'Location',
              prefixIcon: Icon(Icons.place),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
            ),
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter lcoation';
              } else if (errors.containsKey('location_error')) {
                return errors['location_error'];
              }
              return null;
            },
            onChanged: (value) {
              errors.remove('location_error');
            },
          ),
          Padding(padding: const EdgeInsets.all(8.0)),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12.0)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  final Future<Map<String, dynamic>> editSpermBank =
                      manageSpermBank.updateSpermBank(
                          widget.id!, _name.text, _location.text);

                  editSpermBank.then((response) {
                    if (response['status']) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(response['message']),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ));
                      _name.clear();
                      _location.clear();
                      _formKey.currentState!.reset();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(response['message']),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.redAccent,
                      ));
                      Map<String, dynamic> responseErrors = {};
                      var errorFields = response['error'].keys;

                      for (var errorField in errorFields) {
                        responseErrors.putIfAbsent(
                            errorField, () => response['error'][errorField]);
                      }
                      setState(() {
                        errors = responseErrors;
                      });
                    }
                  });
                }
              },
              child: Text(
                'Update Sperm Bank',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
