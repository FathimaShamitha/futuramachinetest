import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/usermodel.dart';

class UserController extends ChangeNotifier {
  static const apiUrl = 'https://jsonplaceholder.typicode.com/users';
  List<UserModel> userList = [];

  bool get isLoading => userList.isEmpty;

  Future<void> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      userList = data.map((userJson) => UserModel.fromJson(userJson)).toList();
      notifyListeners();
    } else {
      throw Exception('Error occurred while loading data');
    }
  }
}
