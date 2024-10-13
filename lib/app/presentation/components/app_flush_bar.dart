import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';

enum SnackBarMessageType { error, warning, success }

void showSnackBar(
  BuildContext context, {
  required String message,
  Duration duration = const Duration(milliseconds: 1200),
  SnackBarMessageType messageType = SnackBarMessageType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: AppTextStyle.snackBarTextStyle),
      duration: duration,
      backgroundColor: switch (messageType) {
        SnackBarMessageType.error => AppColors.snackBarErrorColor,
        SnackBarMessageType.warning => AppColors.snackBarWarningColor,
        SnackBarMessageType.success => AppColors.snackBarSuccessColor,
      },
    ),
  );
}
