import 'package:flutter/material.dart';
import 'package:mvvm/respository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _auth = AuthRepository();

  Future<void> loginApi(BuildContext context, dynamic data) async {
    _auth.loginApi(data).then((value) {
      print(value.toString());
      Utils.showToastMsg('Login has successfully');
      Navigator.pushNamed(context, RoutesName.homeRoute);
    }).onError((error, stackTrace) {
      Utils.showToastMsg(error.toString());
    });
  }

  Future<void> registerApi(dynamic data) async {
    _auth.loginApi(data).then((value) {
      Utils.showToastMsg('You have Register has successfully');
    }).onError((error, stackTrace) {
      Utils.showToastMsg(error.toString());
    });
  }
}
