
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_mvc/Login/model/model.dart';
import 'package:flutter_mvc/Login/services/user_data_service.dart';
import 'package:flutter_mvc/locators.dart';
import 'package:provider/provider.dart';


class Controller {
  Controller({required this.model});
  final Model model;

  // int get counter => model.getCounter();
  // void increment() => model.incrementCounter();
  // void decrement() => model.decrementCounter();

  void setEmail(String email) => model.email = email;
  void setPassword(String password) => model.password = password;
  void getUserDetails() => model.getUserDetails();


  void locatorFetchUsers = locator<UserDataService>().fetchUsers();
  List<Data>? users(BuildContext context) => Provider.of<UserDataService>(context).users;
  bool isLoading(BuildContext context) => Provider.of<UserDataService>(context).isLoading;

}
