import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/app_navigator.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/assets.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/auth/domain/bloc/auth_bloc.dart';
import 'package:fuzzy_greenhouse/greenhouse/presentation/screens/greenhouse_add_screen.dart';
import 'package:fuzzy_greenhouse/greenhouse/presentation/screens/greenhouse_sensors_info_screen.dart';

class GreenhouseScreen extends StatelessWidget {
  const GreenhouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            final displayName = state is AuthBlocStateData ? state.user.displayName : null;
            final photoURL = state is AuthBlocStateData ? state.user.photoURL : null;

            return Row(
              spacing: 12,
              children: [
                if (photoURL != null && photoURL.isNotEmpty)
                  CircleAvatar(
                    backgroundColor: AppColors.cardColor,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100),
                      child: Image.network(
                        photoURL,
                        loadingBuilder: (_, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        },
                      ),
                    ),
                  )
                else if (displayName != null && displayName.isNotEmpty)
                  CircleAvatar(backgroundColor: AppColors.cardColor, child: Text(displayName)),
                Flexible(child: Text('Теплицы', maxLines: 1, style: AppTextStyle.appBarStyle)),
              ],
            );
          },
        ),
      ),
      body: InkWell(
        onTap: () => AppNavigator.pushScreen(context, screen: const GreenhouseSensorsInfoScreen()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.inputFieldColor,
              radius: 24,
              child: AppVectorAssets.greenhouseItem,
            ),
            title: const Text('Антоновская', maxLines: 1, style: AppTextStyle.bodyTextSubtitleThin),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class GreenhouseEmptyView extends StatelessWidget {
  @visibleForTesting
  const GreenhouseEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.greenhouseEmptyScreen, height: 128, width: 128),
          const SizedBox(height: 16),
          Text(
            'У вас нет добавленных\nтеплиц.',
            textAlign: TextAlign.center,
            style: AppTextStyle.appBarStyle.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          AppButton(
            height: 48,
            width: screenWidth(context) / 1.5,
            text: 'Добавить',
            textStyle: AppTextStyle.buttonTextStyle,
            buttonColor: AppColors.accentColor,
            onPressed: () => AppNavigator.pushScreen(context, screen: const GreenhouseAddScreen()),
          ),
        ],
      ),
    );
  }
}
