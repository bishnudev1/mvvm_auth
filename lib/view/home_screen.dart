import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome !"),
      ),
      body:
          Center(child: Text('Greetings user, How can I help you ?')),
    );
  }
}
