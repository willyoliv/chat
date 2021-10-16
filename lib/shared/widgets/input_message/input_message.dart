import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:new_chat/shared/services/upload_file.dart';
import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:new_chat/shared/themes/text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputMessage extends StatefulWidget {
  final user;
  const InputMessage({Key? key, required this.user}) : super(key: key);

  @override
  _InputMessageState createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  String _enteredMessage = '';
  bool _sending = false;
  var _file;
  var _height = 0.0;
  final controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> sendMessage(BuildContext context, String message, user) async {
    String? urlDownloadImg = "";

    if (_file != null) {
      UploadFile uploadFile = UploadFile();
      await uploadFile
          .uploadFile(_file)
          .then((value) => urlDownloadImg = value);
    }

    FocusScope.of(context).unfocus();
    await FirebaseFirestore.instance.collection('chat').add({
      'message': message,
      'createdAt': Timestamp.now(),
      'userId': user.uid!,
      'userName': user.displayName!,
      'userPerfilImageUrl': user.photoURL!,
      'imageUrl': urlDownloadImg,
    });
    setState(() {
      _file = null;
      _height = 0.0;
      _sending = false;
    });
    controller.clear();
  }

  void getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _file = File(image.path);
        _height = 120;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: 10),
              height: _height,
              width: 120,
              child: Stack(
                alignment: Alignment.topLeft,
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: _file != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _file,
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                  if (_file != null)
                    Positioned(
                      top: -20,
                      right: -20,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _file = null;
                            _height = 0.0;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.timesCircle),
                        color: Colors.red,
                        iconSize: 20,
                        splashRadius: 15,
                      ),
                    ),
                  if (_file != null && _sending)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
            if (_file != null && _sending)
              Text(
                "Enviando imagem...",
                textAlign: TextAlign.center,
              ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: 15, top: _file != null ? 10 : 0, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 5),
                width: double.infinity * 0.7,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.background,
                ),
                child: Row(
                  children: [
                    Expanded(
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
                    Material(
                      shape: CircleBorder(),
                      color: AppColors.background,
                      child: IconButton(
                        color: AppColors.grey,
                        iconSize: 20,
                        splashRadius: 18,
                        onPressed: () {
                          getImage();
                        },
                        icon: Icon(
                          FontAwesomeIcons.solidImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: _file != null ? 10 : 0, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_file != null) {
                    setState(() {
                      _sending = true;
                    });
                  }
                  if (_enteredMessage.trim().isNotEmpty || _file != null) {
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
              ),
            )
          ],
        ),
      ],
    );
  }
}
