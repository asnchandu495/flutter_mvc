import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvc/Login/model/model.dart';
import 'package:http/http.dart' as http;

class UserDataService extends ChangeNotifier{
  String userUrl = 'https://reqres.in/api/users';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Data>? users = [];

  Future<List<Data>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print('Error Fetching Users');
    });

    if(result.statusCode == 200){
      Map<String, dynamic> data = json.decode(result.body);
      var _users = data["data"];
      if (_users != null) {
        users = User.fromJson(data).data;
      }
      _isLoading = false;
      print(users?[0].avatar);
      notifyListeners();
      return users;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }
}
