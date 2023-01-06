import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';

class InfoSensorCard extends StatelessWidget {
  const InfoSensorCard({
    Key? key,
    required this.sensorTitle,
    this.icon,
    this.sensorValue,
    this.circleAvatarRadius = 24,
    this.onPressed,
    this.child = const SizedBox.shrink(),
  }) : super(key: key);

  const InfoSensorCard.custom({
    Key? key,
    required this.sensorTitle,
    required this.child,
    this.circleAvatarRadius = 24,
    this.onPressed,
  })  : icon = null,
        sensorValue = null,
        super(key: key);

  final String sensorTitle;

  final Widget? icon;

  final String? sensorValue;

  final double circleAvatarRadius;

  final VoidCallback? onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
                child: AutoSizeText(
                  sensorTitle,
                  maxLines: 1,
                  style: AppTextStyle.bodyTextSubtitle,
                ),
              ),
              const HeightFiller(12),
              if (icon != null && sensorValue != null)
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.circleAvatarColor,
                      radius: circleAvatarRadius,
                      child: icon,
                    ),
                    const WidthFiller(8),
                    Text(sensorValue!, style: AppTextStyle.bodyTextTitle)
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
