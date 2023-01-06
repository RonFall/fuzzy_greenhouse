import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';

class AppTextStyle {
  static const bodyTextTitle = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const bodyTextSubtitle = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const bodyTextSubtitleThin = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const appBarStyle = TextStyle(
    color: AppColors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const buttonTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const alertTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const snackBarTextStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  static const errorViewTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}
