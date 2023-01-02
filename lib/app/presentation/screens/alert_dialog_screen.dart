import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';

Future<T?> choiceAlert<T>(
  BuildContext context, {
  required String bodyText,
  String confirmButtonText = 'Да',
  String cancelButtonText = 'Нет',
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) {
  return onAlertAppear(
    context,
    bodyText: bodyText,
    child: SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: ConfirmButton(
              buttonText: confirmButtonText,
              borderRadiusType: BorderRadiusType.confirm,
              onPressed: onConfirm,
            ),
          ),
          Container(width: 2, color: AppColors.cardColor),
          Expanded(
            child: ConfirmButton(
              buttonText: cancelButtonText,
              borderRadiusType: BorderRadiusType.cancel,
              onPressed: onCancel,
            ),
          ),
        ],
      ),
    ),
  );
}

Future<T?> confirmAlert<T>(
  BuildContext context, {
  required String bodyText,
  String confirmButtonText = 'Ок',
  VoidCallback? onConfirm,
}) {
  return onAlertAppear(
    context,
    bodyText: bodyText,
    child: SizedBox(
      height: 48,
      width: double.maxFinite,
      child: ConfirmButton(buttonText: confirmButtonText, onPressed: onConfirm),
    ),
  );
}

Future<T?> onAlertAppear<T>(
  BuildContext context, {
  required String bodyText,
  Widget child = const SizedBox.shrink(),
}) {
  return showDialog<T>(
    context: context,
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: AppColors.black.withOpacity(0.2)),
            ),
            Center(
              child: Container(
                height: screenWidth(context) / 1.5,
                width: screenWidth(context) / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.bodyColor,
                ),
                child: Center(
                  child: Column(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          bodyText,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.alertTextStyle,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 2,
                        width: double.maxFinite,
                        color: AppColors.cardColor,
                      ),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

enum BorderRadiusType { confirm, cancel, none }

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
    required this.buttonText,
    this.borderRadiusType = BorderRadiusType.none,
    this.onPressed,
  }) : super(key: key);

  final String buttonText;

  final BorderRadiusType borderRadiusType;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.bodyColor),
          overlayColor: MaterialStateProperty.all(
            AppColors.accentColor.withOpacity(0.35),
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: _buttonBorderRadiusType(borderRadiusType),
            ),
          ),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: AppTextStyle.alertTextStyle,
        ),
      ),
    );
  }

  BorderRadius _buttonBorderRadiusType(BorderRadiusType borderRadiusType) {
    if (borderRadiusType == BorderRadiusType.confirm) {
      return const BorderRadius.only(bottomLeft: Radius.circular(16));
    }
    if (borderRadiusType == BorderRadiusType.cancel) {
      return const BorderRadius.only(bottomRight: Radius.circular(16));
    }
    return const BorderRadius.only(
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
    );
  }
}
