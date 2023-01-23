import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/assets.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_textfield.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/app/presentation/screens/loading_dialog_screen.dart';

class AddGreenhouseScreen extends StatelessWidget {
  const AddGreenhouseScreen({Key? key}) : super(key: key);

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
            Image.asset(
              AppAssets.addGreenhouseScreen,
              height: 128,
              width: 128,
            ),
            const HeightFiller(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextField(
                hintText: 'ID теплицы',
                fieldAction: TextInputAction.done,
                onComplete: () => showAfterDelay(context),
              ),
            ),
            const HeightFiller(16),
            AppButton(
              height: 48,
              width: screenWidth(context) / 1.5,
              text: 'Запросить доступ',
              onPressed: () => showAfterDelay(context),
            )
          ],
        ),
      ),
    );
  }

  void showAfterDelay(BuildContext context) {
    LoadingScreen.instance.show(context: context);
    Future.delayed(const Duration(milliseconds: 500), () {
      LoadingScreen.instance.hide();
    });
  }
}
