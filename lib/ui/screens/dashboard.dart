import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dashboard'),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Welcome to the admin dashboard.',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            children: [
              GestureDetector(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text('Manage Sperm Banks'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text('Add action'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
