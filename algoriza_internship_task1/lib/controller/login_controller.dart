import 'package:algoriza_internship_task1/data_source/static/user_data.dart';
import 'package:algoriza_internship_task1/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class LoginController with ChangeNotifier{

  bool isUserFound(String phoneNumber) {
    return usersData.indexWhere((element) => element.phoneNumber == phoneNumber) != -1 ? true : false;
  }

  login(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);
  }
}