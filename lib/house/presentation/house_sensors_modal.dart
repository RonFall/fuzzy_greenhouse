import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_modals.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';

class HouseSensorsModals {
  static Future<T?> showTempHumidModal<T>(BuildContext context) {
    final listParams = [
      'Температура воздуха внутри: 27 °C',
      'Влажность воздуха внутри: 47 %',
      'Температура воздуха снаружи: 12 °C',
      'Влажность воздуха снаружи: 34 %',
      'Последнее измерение: 11:06 05.01.23'
    ];
    return AppModals.showModal<T?>(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                'Температура и влажность',
                maxLines: 1,
                style: AppTextStyle.appBarStyle.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const AutoSizeText('Сводка', style: AppTextStyle.bodyTextTitle),
            for (String param in listParams)
              AutoSizeText(
                param,
                maxLines: 1,
                style: AppTextStyle.bodyTextSubtitleThin,
              ),
            const AutoSizeText('Контроль', style: AppTextStyle.bodyTextTitle),
            ..._sliderWidget(
              deviceText: 'Обороты выдува',
              deviceTextValue: '1200 об/мин',
              currentValue: 38,
              icon: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.infoButtonColor,
                ),
              ),
              onChanged: (value) {},
            ),
            ..._sliderWidget(
              deviceText: 'Температура нагревателя',
              deviceTextValue: '42 °C',
              currentValue: 56,
              onChanged: (value) {},
            ),
          ].divideTiles(divider: const HeightFiller(12)).toList(),
        ),
      ),
    );
  }

  static List<Widget> _sliderWidget({
    required String deviceText,
    required String deviceTextValue,
    required void Function(double value) onChanged,
    Widget? icon,
    double currentValue = 42,
    double minValue = 0,
    double maxValue = 100,
  }) {
    return [
      Row(
        children: [
          Flexible(
            child: Text(deviceText, style: AppTextStyle.bodyTextSubtitleThin),
          ),
          if (icon != null) const WidthFiller(4),
          if (icon != null) icon,
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Slider(
              activeColor: AppColors.accentColor,
              inactiveColor: AppColors.accentColor.withOpacity(0.4),
              value: currentValue,
              min: minValue,
              max: maxValue,
              onChanged: onChanged,
            ),
          ),
          Flexible(
            flex: 2,
            child: AutoSizeText(
              deviceTextValue,
              maxLines: 1,
              style: AppTextStyle.bodyTextSubtitle,
            ),
          ),
        ],
      ),
    ];
  }
}
