import 'package:new_chat/shared/auth/google_signin_provider.dart';
import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:new_chat/shared/themes/text_styles.dart';
import 'package:new_chat/shared/widgets/Messages/messages.dart';
import 'package:new_chat/shared/widgets/input_message/input_message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final user;

  const ChatPage({Key? key, required this.user}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chat",
          style: TextStyles.titleBoldHeading,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          InkWell(
            customBorder: CircleBorder(),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                FontAwesomeIcons.signOutAlt,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogOut();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(child: Messages(user: widget.user)),
              Container(
                color: AppColors.backgroundSecundary,
                padding: EdgeInsets.only(top: 10),
                child: InputMessage(user: widget.user),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
