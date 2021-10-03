import 'package:new_chat/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final buttonGray = GoogleFonts.inter(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static final titleUserHome = GoogleFonts.roboto(
      fontSize: 24, fontWeight: FontWeight.normal, color: AppColors.primary);
  static final titleLogin = GoogleFonts.lexendDeca(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
  );
  static final titleBoldHeading = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static final titleWelcome = GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.grey,
  );
  static final input = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
}
