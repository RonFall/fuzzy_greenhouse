import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';


class InfoListTile extends StatelessWidget {
  const InfoListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.trailing,
  }) : super(key: key);

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
            CircleAvatar(
              backgroundColor: AppColors.circleAvatarColor,
              child: icon,
            ),
            const WidthFiller(16),
            Flexible(
              child: Text(
                title,
                style: AppTextStyle.bodyTextSubtitle,
              ),
            ),
          ],
        ),
        trailing,
      ],
    );
  }
}
