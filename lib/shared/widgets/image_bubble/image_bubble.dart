import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_chat/shared/themes/app_colors.dart';

class ImageBubble extends StatelessWidget {
  final String imageUrl;
  final bool belongsToMe;
  const ImageBubble({
    Key? key,
    required this.imageUrl,
    required this.belongsToMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
        constraints: BoxConstraints(minWidth: 180, maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Hero(
            tag: imageUrl,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      belongsToMe ? Colors.white : AppColors.primary),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/image_page', arguments: imageUrl);
      },
    );
  }
}
