import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Не удалось загрузить данные\nс сервера. Проверьте свое'
            '\nсоединение, либо обратитесь к\nадминистратору.',
            textAlign: TextAlign.center,
            style: AppTextStyle.errorViewTextStyle,
          ),
        ),
        const SizedBox(height: 16),
        AppButton(
          height: 48,
          width: screenWidth(context) / 1.5,
          textStyle: AppTextStyle.buttonTextStyle,
          buttonColor: AppColors.accentColor,
          onPressed: onPressed,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Попробовать еще раз',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: AppTextStyle.buttonTextStyle,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.restart_alt_rounded, size: 22, color: AppColors.white),
            ],
          ),
        ),
      ],
    );
  }
}
