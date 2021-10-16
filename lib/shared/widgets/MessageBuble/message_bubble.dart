import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/shared/widgets/image_bubble/image_bubble.dart';

class MessageBubble extends StatelessWidget {
  final Key keyBubble;
  final String userName;
  final String userImage;
  final String message;
  final bool belongsToMe;
  final String imageUrl;

  const MessageBubble({
    Key? key,
    required this.keyBubble,
    required this.userName,
    required this.userImage,
    required this.message,
    required this.imageUrl,
    required this.belongsToMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (!this.urlImage.trim().isEmpty) ImageBubble(urlImage: urlImage),
        Container(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: belongsToMe
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: belongsToMe
                          ? AppColors.primary
                          : AppColors.backgroundSecundary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: belongsToMe
                            ? Radius.circular(20)
                            : Radius.circular(0),
                        bottomRight: belongsToMe
                            ? Radius.circular(0)
                            : Radius.circular(20),
                      ),
                    ),
                    // height: 200,
                    constraints: BoxConstraints(maxWidth: 200),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: belongsToMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (!belongsToMe)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                margin: EdgeInsets.only(
                                  top: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                child: Text(
                                  userName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (!this.imageUrl.trim().isEmpty)
                          ImageBubble(
                            imageUrl: imageUrl,
                            belongsToMe: belongsToMe,
                          ),
                        if (!this.message.trim().isEmpty)
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              message,
                              style: TextStyle(
                                color: belongsToMe
                                    ? AppColors.background
                                    : AppColors.grey,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (!belongsToMe)
                Positioned(
                  top: 0,
                  left: 180,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(this.userImage),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
