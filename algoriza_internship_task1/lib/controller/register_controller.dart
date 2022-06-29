import 'package:algoriza_internship_task1/data_source/static/user_data.dart';
import 'package:algoriza_internship_task1/models/user_model.dart';
import 'package:algoriza_internship_task1/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {

  bool _isShowPassword = false;
  bool get isShowPassword => _isShowPassword;
  changeIsShowPassword() {_isShowPassword = !_isShowPassword; notifyListeners();}

  bool isUserFound(UserModel userModel) {
    return usersData.indexWhere((element) => element.email == userModel.email || element.phoneNumber == userModel.phoneNumber) != -1 ? true : false;
  }

  register(BuildContext context, UserModel userModel) {
    if(isUserFound(userModel)) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This account already found'), backgroundColor: Colors.red));
    }
    else {
      usersData.add(userModel);
      Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);
    }
  }
}