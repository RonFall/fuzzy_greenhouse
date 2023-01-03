import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';

enum MessageType { error, warning, success }

void showFlushBar(
  BuildContext context, {
  required String message,
  Duration duration = const Duration(milliseconds: 1200),
  Duration animationDuration = const Duration(milliseconds: 300),
  FlushbarPosition position = FlushbarPosition.TOP,
  MessageType messageType = MessageType.error,
}) {
  Flushbar(
    backgroundColor: _messageColor(messageType),
    messageText: Text(
      message,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.snackBarTextStyle,
    ),
    duration: duration,
    animationDuration: animationDuration,
    flushbarPosition: position,
    borderRadius: BorderRadius.circular(16),
    margin: const EdgeInsets.symmetric(horizontal: 16),
    positionOffset: 32,
  ).show(context);
}

Color _messageColor(MessageType messageType) {
  if (messageType == MessageType.error) return AppColors.snackBarErrorColor;
  if (messageType == MessageType.warning) return AppColors.snackBarWarningColor;
  if (messageType == MessageType.success) return AppColors.snackBarSuccessColor;
  return AppColors.black;
}
