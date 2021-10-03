import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key keyBubble;
  final String userName;
  final String userImage;
  final String message;
  final bool belongsToMe;

  const MessageBubble({
    Key? key,
    required this.keyBubble,
    required this.userName,
    required this.userImage,
    required this.message,
    required this.belongsToMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment:
                belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: belongsToMe
                      ? AppColors.primary
                      : AppColors.textBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft:
                        belongsToMe ? Radius.circular(15) : Radius.circular(0),
                    bottomRight:
                        belongsToMe ? Radius.circular(0) : Radius.circular(15),
                  ),
                ),
                width: 180,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
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
                      Text(
                        userName,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    Text(
                      message,
                      style: TextStyle(
                        color:
                            belongsToMe ? AppColors.background : AppColors.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!belongsToMe)
            Positioned(
              top: 0,
              left: 170,
              child: CircleAvatar(
                backgroundImage: NetworkImage(this.userImage),
              ),
            ),
        ],
      ),
    );
  }
}
