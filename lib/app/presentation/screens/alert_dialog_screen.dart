import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';

enum BorderRadiusType { confirm, cancel, none }

class AlertScreen {
  AlertScreen._();

  static final AlertScreen instance = AlertScreen._();

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
        child: ConfirmButton(
          buttonText: confirmButtonText,
          onPressed: onConfirm,
        ),
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
                child: ColoredBox(color: AppColors.black.withValues(alpha: 0.2)),
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
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    required this.buttonText,
    this.borderRadiusType = BorderRadiusType.none,
    this.onPressed,
    super.key,
  });

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
          backgroundColor: WidgetStateProperty.all(AppColors.bodyColor),
          overlayColor: WidgetStateProperty.all(
            AppColors.accentColor.withValues(alpha: 0.35),
          ),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
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
    return switch (borderRadiusType) {
      BorderRadiusType.confirm => const BorderRadius.only(
          bottomLeft: Radius.circular(16),
        ),
      BorderRadiusType.cancel => const BorderRadius.only(
          bottomRight: Radius.circular(16),
        ),
      _ => const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
    };
  }
}
