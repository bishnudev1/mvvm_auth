import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
        title: Text("Login Now !"),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, RoutesName.homeRoute);
                Utils.showToastMsg('No Internet Connection');
                //Utils.showFlushbarErrorMsg('No Connection has been established', context);
              },
              child: Text('Login'))),
    );
  }
}
