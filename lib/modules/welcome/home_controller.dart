import 'package:flutter/material.dart';

class WelcomeController {
  Future<void> openChat(BuildContext context) async {
    Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed("/chat");
  }
}