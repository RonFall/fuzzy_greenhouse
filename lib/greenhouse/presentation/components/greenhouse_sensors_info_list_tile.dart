import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';

class GreenhouseInfoListTile extends StatelessWidget {
  const GreenhouseInfoListTile({required this.title, required this.icon, required this.trailing, super.key});

  final String title;
  final Widget icon;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(backgroundColor: AppColors.circleAvatarColor, child: icon),
            const SizedBox(width: 16),
            Flexible(child: Text(title, maxLines: 1, style: AppTextStyle.bodyTextSubtitle)),
          ],
        ),
        trailing,
      ],
    );
  }
}
