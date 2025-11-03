import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuzzy_greenhouse/app/app_providers.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/view/app_error_view.dart';
import 'package:fuzzy_greenhouse/house/presentation/components/sensors_info_card.dart';
import 'package:fuzzy_greenhouse/house/presentation/components/sensors_info_list_tile.dart';
import 'package:fuzzy_greenhouse/house/presentation/house_sensors_modal.dart';

class HouseSensorsInfoScreen extends ConsumerWidget {
  const HouseSensorsInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceData = ref.watch(devicesStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text('Антоновская', style: AppTextStyle.appBarStyle),
        actions: [
          InkWell(
            onTap: ref.read(devicesStateProvider.notifier).getDevicesData,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.refresh_rounded, size: 32),
            ),
          ),
        ],
      ),
      body: deviceData.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.accentColor)),
        error: (error, stackTrace) {
          return Center(child: AppErrorView(onPressed: ref.read(devicesStateProvider.notifier).getDevicesData));
        },
        data: (data) {
          if (data == null || (data.humidity == null && data.illumination == null && data.temperature == null)) {
            return Column(
              children: [Text('Данные не найдены', style: AppTextStyle.appBarStyle.copyWith(color: Colors.black))],
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Информация', style: AppTextStyle.bodyTextTitle),
              const SizedBox(height: 16),
              InfoListTile(
                icon: const Icon(Icons.zoom_out_map_rounded),
                title: 'Площадь',
                trailing: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(child: Text('12 м', style: AppTextStyle.bodyTextSubtitle)),
                    Flexible(child: Text('2', style: AppTextStyle.bodyTextSubtitle.copyWith(fontSize: 9))),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              InfoListTile(
                icon: const Icon(Icons.pin_drop_rounded),
                title: 'Расположение',
                trailing: Column(
                  children: [
                    Text('47.28 с.ш.', style: AppTextStyle.bodyTextSubtitle.copyWith(fontSize: 14)),
                    Text('39.56 в.д.', style: AppTextStyle.bodyTextSubtitle.copyWith(fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const InfoListTile(
                icon: Icon(Icons.door_front_door_rounded),
                title: 'Количество дверей',
                trailing: Text('2', style: AppTextStyle.bodyTextSubtitle),
              ),
              const SizedBox(height: 12),
              const InfoListTile(
                icon: Icon(Icons.window_rounded),
                title: 'Количество окон',
                trailing: Text('6', style: AppTextStyle.bodyTextSubtitle),
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 24),
              const Text('Показания', style: AppTextStyle.bodyTextTitle),
              const SizedBox(height: 16),
              InfoSensorCard.custom(
                sensorTitle: 'Температура и влажность',
                onPressed:
                    () => HouseSensorsModals.showTempHumidModal(
                      context,
                      hum: data.humidity ?? 0,
                      temp: data.temperature ?? 0,
                    ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.circleAvatarColor,
                          radius: 24,
                          child: Icon(Icons.thermostat_rounded, size: 32, color: AppColors.tempSensorColor),
                        ),
                        const SizedBox(width: 8),
                        Flexible(child: Text('${data.temperature} °C', style: AppTextStyle.bodyTextTitle)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.circleAvatarColor,
                          radius: 24,
                          child: Icon(Icons.water_drop, size: 32, color: AppColors.humSensorColor),
                        ),
                        const SizedBox(width: 8),
                        Flexible(child: Text('${data.humidity} %', style: AppTextStyle.bodyTextTitle)),
                      ],
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 8),
              // TODO(RonFall): Сделать вызов модалки
              // InfoSensorCard(
              //   sensorTitle: 'Уровень воды в баке',
              //   icon: const Icon(
              //     Icons.waves_rounded,
              //     size: 32,
              //     color: AppColors.levelSensorColor,
              //   ),
              //   sensorValue: '0 л.',
              //   onPressed: () {},
              // ),
              const SizedBox(height: 8),
              // TODO(RonFall): Сделать вызов модалки
              InfoSensorCard(
                sensorTitle: 'Уровень освещенности',
                icon: const Icon(Icons.light_mode_rounded, size: 32, color: AppColors.lightSensorColor),
                sensorValue: '${data.illumination} лк',
                onPressed: () {},
              ),
              // const SizedBox(height: 8),
              // InfoSensorCard(
              //   sensorTitle: 'Уровень CO2',
              //   icon: const Icon(
              //     Icons.co2_rounded,
              //     size: 32,
              //     color: AppColors.co2SensorColor,
              //   ),
              //   sensorValue: '0 ppm',
              //   onPressed: () {},
              // ),
            ],
          );
        },
      ),
    );
  }
}
