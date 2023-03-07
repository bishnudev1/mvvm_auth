import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  RoundButton(
      {required this.title, this.loading = true, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AllColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: loading
              ? Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )
              : CircleAvatar(),
        ),
      ),
    );
  }
}
