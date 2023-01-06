import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/house/presentation/components/sensors_info_card.dart';
import 'package:fuzzy_greenhouse/house/presentation/components/sensors_info_list_tile.dart';
import 'package:fuzzy_greenhouse/house/presentation/house_sensors_modal.dart';

class HouseSensorsInfoScreen extends StatelessWidget {
  const HouseSensorsInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text('Антоновская', style: AppTextStyle.appBarStyle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Информация', style: AppTextStyle.bodyTextTitle),
            const HeightFiller(16),
            InfoListTile(
              icon: const Icon(Icons.zoom_out_map_rounded),
              title: 'Площадь',
              trailing: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    child: Text('12 м', style: AppTextStyle.bodyTextSubtitle),
                  ),
                  Flexible(
                    child: Text(
                      '2',
                      style: AppTextStyle.bodyTextSubtitle.copyWith(
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HeightFiller(12),
            InfoListTile(
              icon: const Icon(Icons.pin_drop_rounded),
              title: 'Расположение',
              trailing: Column(
                children: [
                  Text(
                    '47.28 с.ш.',
                    style: AppTextStyle.bodyTextSubtitle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '39.56 в.д.',
                    style: AppTextStyle.bodyTextSubtitle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const HeightFiller(12),
            const InfoListTile(
              icon: Icon(Icons.door_front_door_rounded),
              title: 'Количество дверей',
              trailing: Text('2', style: AppTextStyle.bodyTextSubtitle),
            ),
            const HeightFiller(12),
            const InfoListTile(
              icon: Icon(Icons.window_rounded),
              title: 'Количество окон',
              trailing: Text('6', style: AppTextStyle.bodyTextSubtitle),
            ),
            const HeightFiller(12),
            // TODO(RonFall): Если схема доступна показываем
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: InfoListTile(
                  icon: Icon(Icons.map_rounded),
                  title: 'Скачать схему',
                  trailing: Icon(Icons.sim_card_download_rounded, size: 32),
                ),
              ),
            ),
            const HeightFiller(24),
            const Text('Показания', style: AppTextStyle.bodyTextTitle),
            const HeightFiller(16),
            InfoSensorCard.custom(
              sensorTitle: 'Температура и влажность',
              onPressed: () => HouseSensorsModals.showTempHumidModal(context),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: AppColors.circleAvatarColor,
                        radius: 24,
                        child: Icon(
                          Icons.thermostat_rounded,
                          size: 32,
                          color: AppColors.tempSensorColor,
                        ),
                      ),
                      WidthFiller(8),
                      Flexible(
                        child: Text('27 °C', style: AppTextStyle.bodyTextTitle),
                      ),
                    ],
                  ),
                  const HeightFiller(8),
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: AppColors.circleAvatarColor,
                        radius: 24,
                        child: Icon(
                          Icons.water_drop,
                          size: 32,
                          color: AppColors.humSensorColor,
                        ),
                      ),
                      WidthFiller(8),
                      Flexible(
                        child: Text('47 %', style: AppTextStyle.bodyTextTitle),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const HeightFiller(8),
            // TODO(RonFall): Сделать вызов модалки
            InfoSensorCard(
              sensorTitle: 'Уровень воды в баке',
              icon: const Icon(
                Icons.waves_rounded,
                size: 32,
                color: AppColors.levelSensorColor,
              ),
              sensorValue: '106 л.',
              onPressed: () {},
            ),
            const HeightFiller(8),
            // TODO(RonFall): Сделать вызов модалки
            InfoSensorCard(
              sensorTitle: 'Уровень освещенности',
              icon: const Icon(
                Icons.light_mode_rounded,
                size: 32,
                color: AppColors.lightSensorColor,
              ),
              sensorValue: '380 лк',
              onPressed: () {},
            ),
            const HeightFiller(8),
            InfoSensorCard(
              sensorTitle: 'Уровень CO2',
              icon: const Icon(
                Icons.co2_rounded,
                size: 32,
                color: AppColors.co2SensorColor,
              ),
              sensorValue: '1204 ppm',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
