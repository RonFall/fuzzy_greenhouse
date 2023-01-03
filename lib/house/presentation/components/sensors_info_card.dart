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
    this.child = const SizedBox.shrink(),
  }) : super(key: key);

  const InfoSensorCard.custom({
    Key? key,
    required this.sensorTitle,
    required this.child,
  })  : icon = null,
        sensorValue = null,
        super(key: key);

  final String sensorTitle;

  final Widget? icon;

  final String? sensorValue;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.infoCardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(sensorTitle, style: AppTextStyle.bodyTextSubtitle),
            ),
          ),
          const HeightFiller(12),
          if (icon != null && sensorValue != null)
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.circleAvatarColor,
                  child: icon,
                ),
                const HeightFiller(4),
                Text(sensorValue!, style: AppTextStyle.bodyTextSubtitle)
              ],
            )
          else
            child,
        ],
      ),
    );
  }
}