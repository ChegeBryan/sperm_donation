import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:sperm_donation/services/backend.dart';

enum Status { Waiting, InProgress, Completed, Failed }

class SpermBankProvider with ChangeNotifier {
  Status _actionStatus = Status.Waiting;

  Status get actionStatus => _actionStatus;

  Future<Map<String, dynamic>> addSpermBank(
      String name, String location) async {
    var result;

    final Map<String, dynamic> data = {'name': name, 'location': location};

    _actionStatus = Status.InProgress;
    notifyListeners();

    Response res = await post(
      Uri.parse(BackendUrl.addSpermBank),
      body: data,
    );

    final Map<String, dynamic> responseData = jsonDecode(res.body);

    if (!responseData['error']) {
      _actionStatus = Status.Completed;
      notifyListeners();
      result = {'status': true, 'message': 'Successfully added sperm bank.'};
    } else {
      _actionStatus = Status.Failed;
      notifyListeners();
      result = {'status': true, 'message': 'Failed to add sperm bank.'};
    }
    return result;
  }

  Future<Map<String, dynamic>> getSpermBanks() async {
    var result;

    Response res = await get(Uri.parse(BackendUrl.getSpermBanks));

    final Map<String, dynamic> responseData = jsonDecode(res.body);

    if (!responseData['error']) {
      result = {'status': true, 'data': responseData['data']};
    } else {
      result = {'status': false, 'message': responseData['message']};
    }
    return result;
  }
}
