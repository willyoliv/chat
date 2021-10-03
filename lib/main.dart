import 'package:new_chat/chat_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/shared/auth/google_signin_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const MaterialColor PrimaryColor = const MaterialColor(
      0xFF6089FF,
      const <int, Color>{
        50: const Color(0xFF6089FF),
        100: const Color(0xFF6089FF),
        200: const Color(0xFF6089FF),
        300: const Color(0xFF6089FF),
        400: const Color(0xFF6089FF),
        500: const Color(0xFF6089FF),
        600: const Color(0xFF6089FF),
        700: const Color(0xFF6089FF),
        800: const Color(0xFF6089FF),
        900: const Color(0xFF6089FF),
      },
    );
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: PrimaryColor,
        ),
        home: ChatApp(),
      ),
    );
  }
}
