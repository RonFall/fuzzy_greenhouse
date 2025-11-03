import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/assets.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_textfield.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';

class AddGreenhouseScreen extends StatelessWidget {
  const AddGreenhouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text('Добавить теплицу', style: AppTextStyle.appBarStyle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.addGreenhouseScreen, height: 128, width: 128),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextField(
                hintText: 'ID теплицы',
                fieldAction: TextInputAction.done,
                onComplete: () => _showAfterDelay(context),
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              height: 48,
              width: screenWidth(context) / 1.5,
              text: 'Запросить доступ',
              onPressed: () => _showAfterDelay(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showAfterDelay(BuildContext context) {
    LoadingScreen.instance.show(context);
    Future.delayed(const Duration(milliseconds: 500), () {
      LoadingScreen.instance.hide();
    });
  }
}
