import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';

class GreenhouseInfoSensorCard extends StatelessWidget {
  const GreenhouseInfoSensorCard({
    required this.sensorTitle,
    this.circleAvatarRadius = 24,
    this.child = const SizedBox.shrink(),
    this.icon,
    this.sensorValue,
    this.onPressed,
    super.key,
  });

  const GreenhouseInfoSensorCard.custom({
    required this.sensorTitle,
    required this.child,
    this.circleAvatarRadius = 24,
    this.onPressed,
    super.key,
  }) : icon = null,
       sensorValue = null;

  final String sensorTitle;
  final double circleAvatarRadius;
  final Widget child;
  final Widget? icon;
  final String? sensorValue;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final sensorValue = this.sensorValue;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.infoCardColor, Color(0xFFA9DAEE)],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(sensorTitle, maxLines: 1, style: AppTextStyle.bodyTextSubtitle),
              ),
              const SizedBox(height: 12),
              if (icon != null && sensorValue != null)
                Row(
                  children: [
                    CircleAvatar(backgroundColor: AppColors.circleAvatarColor, radius: circleAvatarRadius, child: icon),
                    const SizedBox(width: 8),
                    Text(sensorValue, style: AppTextStyle.bodyTextTitle),
                  ],
                )
              else
                child,
            ],
          ),
        ),
      ),
    );
  }
}
