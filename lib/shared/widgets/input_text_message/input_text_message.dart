import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:new_chat/shared/themes/text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputTextMessage extends StatefulWidget {
  final user;
  const InputTextMessage({Key? key, required this.user}) : super(key: key);

  @override
  _InputTextMessageState createState() => _InputTextMessageState();
}

class _InputTextMessageState extends State<InputTextMessage> {
  String _enteredMessage = '';
  final controller = TextEditingController();

  Future<void> sendMessage(BuildContext context, String message, user) async {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'message': message,
      'createdAt': Timestamp.now(),
      'userId': user.uid!,
      'userName': user.displayName!,
      'userPerfilImageUrl': user.photoURL!,
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity * 0.7,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.textBackground,
            ),
            child: TextField(
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyles.input,
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enviar mensagem...",
                hintStyle: TextStyles.input,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_enteredMessage.trim().isNotEmpty) {
              sendMessage(context, _enteredMessage, widget.user);
            }
          },
          child: Icon(
            FontAwesomeIcons.solidPaperPlane,
            size: 20,
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(right: 2),
            shape: CircleBorder(),
          ),
        )
      ],
    );
  }
}
