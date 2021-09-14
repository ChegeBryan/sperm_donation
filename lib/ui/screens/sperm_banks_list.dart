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
    SpermBankProvider manageSpermBank = Provider.of<SpermBankProvider>(context);

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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/editSpermBank',
                            arguments: {
                              'name': snapshot.data!['data'][index]['name'],
                              'location': snapshot.data!['data'][index]
                                  ['location'],
                              'id': snapshot.data!['data'][index]['id'],
                            },
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          final Future<Map<String, dynamic>> deleteSpermBank =
                              manageSpermBank.deleteSpermBank(
                                  snapshot.data!['data'][index]['id']);

                          deleteSpermBank.then((response) {
                            if (response['status']) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(response['message']),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(response['message']),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          });
                        },
                        icon: Icon(Icons.delete_forever),
                      )
                    ],
                  )),
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addSpermBank');
          },
          child: Icon(Icons.add)),
    );
  }
}
