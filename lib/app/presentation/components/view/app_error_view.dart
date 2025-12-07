import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({this.details, super.key});

  final FlutterErrorDetails? details;

  @override
  Widget build(BuildContext context) {
    final warnTextColor = Colors.yellow[600];

    return ColoredBox(
      color: Colors.red[300]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ошибка при репрезентации UI', style: TextStyle(fontSize: 24, color: warnTextColor)),
            SizedBox(height: 16),
            Text('Детали:', style: TextStyle(fontSize: 16, color: warnTextColor)),
            SizedBox(height: 16),
            Flexible(
              child: ListView(children: [SelectableText(details.toString(), style: TextStyle(color: warnTextColor))]),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Отправить лог')),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
