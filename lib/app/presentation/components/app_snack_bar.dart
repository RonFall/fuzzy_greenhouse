import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';

enum MessageType { error, warning, success }

void showSnackBar(
  BuildContext context, {
  required String message,
  Duration duration = const Duration(milliseconds: 1200),
  MessageType messageType = MessageType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.snackBarTextStyle,
      ),
      duration: duration,
      backgroundColor: _messageColor(messageType),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    ),
  );
}

Color? _messageColor(MessageType messageType) {
  if (messageType == MessageType.error) return AppColors.snackBarErrorColor;
  if (messageType == MessageType.warning) return AppColors.snackBarWarningColor;
  if (messageType == MessageType.success) return AppColors.snackBarSuccessColor;
  return null;
}
