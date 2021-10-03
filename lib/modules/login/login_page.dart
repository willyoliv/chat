import 'package:new_chat/shared/auth/google_signin_provider.dart';
import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:new_chat/shared/themes/app_images.dart';
import 'package:new_chat/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidComments,
                      color: AppColors.primary,
                      size: 180,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Chat",
                        style: TextStyles.titleLogin,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Seja bem-vindo ao meu app de chat",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(250, 50),
                          primary: AppColors.shape,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: Image.asset(
                          AppImages.google,
                          height: 25,
                          width: 25,
                        ),
                        label: Text(
                          "Entrar com Google",
                          style: TextStyles.buttonGray,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
