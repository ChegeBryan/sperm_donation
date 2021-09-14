import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sperm_donation/services/sperm_bank.dart';

class SpermBanksList extends StatefulWidget {
  const SpermBanksList({Key? key}) : super(key: key);

  @override
  _SpermBanksListState createState() => _SpermBanksListState();
}

class _SpermBanksListState extends State<SpermBanksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sperm banks'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<SpermBankProvider>(context, listen: false)
            .getSpermBanks(),
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!['status'] && snapshot.data!['data'].isEmpty) {
              return Center(
                child: Text('No sperm banks registered.'),
              );
            }
            if (!snapshot.data!['status']) {
              return Center(child: Text(snapshot.data!['message']));
            }
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(snapshot.data!['data'][index]['name']),
                subtitle: Text(snapshot.data!['data'][index]['location']),
                onTap: () {},
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: snapshot.data!['data'].length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
