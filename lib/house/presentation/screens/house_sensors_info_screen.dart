import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/house/presentation/components/sensors_info_card.dart';
import 'package:fuzzy_greenhouse/house/presentation/components/sensors_info_list_tile.dart';

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
                    '53.64 с.ш.',
                    style: AppTextStyle.bodyTextSubtitle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '43.28 в.д.',
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
            InfoListTile(
              icon: const Icon(Icons.map_rounded),
              title: 'Скачать схему',
              trailing: InkWell(
                onTap: () {},
                child: const Icon(Icons.sim_card_download_rounded, size: 32),
              ),
            ),
            const HeightFiller(24),
            const Text('Показания', style: AppTextStyle.bodyTextTitle),
            const HeightFiller(16),
            InfoSensorCard.custom(
              sensorTitle: 'Температура и влажность',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: AppColors.circleAvatarColor,
                        child: Icon(
                          Icons.thermostat_rounded,
                          color: AppColors.tempSensorColor,
                        ),
                      ),
                      HeightFiller(4),
                      Text('27 C', style: AppTextStyle.bodyTextSubtitle)
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: AppColors.circleAvatarColor,
                        child: Icon(
                          Icons.water_drop,
                          color: AppColors.humSensorColor,
                        ),
                      ),
                      HeightFiller(4),
                      Text('47 %', style: AppTextStyle.bodyTextSubtitle)
                    ],
                  ),
                ],
              ),
            ),
            const HeightFiller(8),
            const InfoSensorCard(
              sensorTitle: 'Уровень воды в баке',
              icon: Icon(
                Icons.waves_rounded,
                color: AppColors.levelSensorColor,
              ),
              sensorValue: '106 л.',
            ),
            const HeightFiller(8),
            const InfoSensorCard(
              sensorTitle: 'Уровень освещенности',
              icon: Icon(
                Icons.light_mode_rounded,
                color: Color.fromARGB(255, 243, 252, 244),
              ),
              sensorValue: '1200 люкс',
            ),
          ],
        ),
      ),
    );
  }
}
