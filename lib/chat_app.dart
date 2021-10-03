import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_chat/modules/login/login_page.dart';
import 'package:new_chat/modules/welcome/welcome_page.dart';

class ChatApp extends StatelessWidget {
  ChatApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Alguma coisa deu errado"),
            );
          } else if (snapshot.hasData) {
            return WelcomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
