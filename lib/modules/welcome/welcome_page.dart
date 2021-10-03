import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/modules/chat/chat_page.dart';
import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:new_chat/shared/themes/text_styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bem vindo(a)",
                      style: TextStyles.titleWelcome,
                    ),
                    FittedBox(
                      child: Text(
                        "${user.displayName!}",
                        style: TextStyles.titleUserHome,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return ChatPage(user: user);
        }
      },
    );
  }
}
