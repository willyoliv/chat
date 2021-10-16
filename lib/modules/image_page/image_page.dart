import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:new_chat/shared/themes/text_styles.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primary, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Imagem",
          style: TextStyles.titleBoldHeading,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Material(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
