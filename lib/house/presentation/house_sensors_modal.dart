import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_modals.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';

class HouseSensorsModals {
  static Future<T?> showTempHumidModal<T>(
    BuildContext context, {
    required int temp,
    required int hum,
  }) {
    final listParams = [
      'Температура воздуха внутри: $temp °C',
      'Влажность воздуха внутри: $hum %',
      'Температура воздуха снаружи: 0 °C',
      'Влажность воздуха снаружи: 0 %',
      'Последнее измерение: 00:00 00.00.00'
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
              child: Text(
                'Температура и влажность',
                maxLines: 1,
                style: AppTextStyle.appBarStyle.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const Text('Сводка', style: AppTextStyle.bodyTextTitle),
            for (final param in listParams)
              Text(
                param,
                maxLines: 1,
                style: AppTextStyle.bodyTextSubtitleThin,
              ),
            const Text('Контроль', style: AppTextStyle.bodyTextTitle),
            ..._sliderWidget(
              deviceText: 'Обороты вентилятора',
              deviceTextValue: '0 об/мин',
              currentValue: 0,
              icon: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.infoButtonColor,
                ),
              ),
            ),
            ..._sliderWidget(
              deviceText: 'Температура нагревателя',
              deviceTextValue: '0 °C',
              currentValue: 0,
            ),
          ].divideTiles(divider: const SizedBox(height: 12)).toList(),
        ),
      ),
    );
  }

  static List<Widget> _sliderWidget({
    required String deviceText,
    required String deviceTextValue,
    double currentValue = 42,
    double minValue = 0,
    double maxValue = 100,
    Widget? icon,
    ValueChanged<double>? onChanged,
  }) {
    return [
      Row(
        children: [
          Flexible(
            child: Text(deviceText, style: AppTextStyle.bodyTextSubtitleThin),
          ),
          if (icon != null) ...[
            const SizedBox(width: 4),
            icon,
          ]
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
            child: Text(
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
