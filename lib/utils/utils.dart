import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showToastMsg(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 20);
  }

  static showFlushbarErrorMsg(String message, BuildContext context) {
    Flushbar(
      message: message,
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(20),
      duration: Duration(seconds: 10),
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }

  static showSnackbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void onFormFieldChange(
      BuildContext context, FocusNode prevNode, FocusNode nextNode) {
    prevNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }
}
