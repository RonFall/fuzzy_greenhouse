import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';

class HeightFiller extends StatelessWidget {
  const HeightFiller(this.height, {Key? key}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(key: key, height: height);
}

class WidthFiller extends StatelessWidget {
  const WidthFiller(this.width, {Key? key}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(key: key, width: width);
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.height,
    this.width,
    this.text,
    this.buttonStyle,
    this.child,
    this.onPressed,
    this.textStyle = AppTextStyle.buttonTextStyle,
    this.buttonColor = AppColors.accentColor,
  }) : super(key: key);

  /// Высота кнопки
  final double? height;

  /// Ширина кнопки
  final double? width;

  /// Текст кнопки
  final String? text;

  /// Стиль кнопки
  final ButtonStyle? buttonStyle;

  /// Виджет-потомок, если нет текста кнопки
  final Widget? child;

  /// Событие при нажатии
  final VoidCallback? onPressed;

  /// Стиль текста кнопки
  final TextStyle textStyle;

  /// Цвет кнопки
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        style: buttonStyle ??
            ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
        child: text != null ? Text(text!, style: textStyle) : child,
      ),
    );
  }
}

bool isKeyboardVisible(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom > 1;
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// Высота конкретного экарана
double screenHeight(BuildContext context) {
  return getScreenSize(context).height;
}

/// Ширина конкретного экарана
double screenWidth(BuildContext context) {
  return getScreenSize(context).width;
}

extension IterableExtension on Iterable<Widget>? {
  Iterable<Widget> divideTiles({
    Widget divider = const Divider(),
  }) {
    if (this == null) return [];
    final tiles = this!.toList();

    if (tiles.isEmpty || tiles.length == 1) {
      return tiles;
    }

    Iterable<Widget> wrapTile(Widget tile) {
      return [tile, divider];
    }

    return <Widget>[
      for (final item in tiles.take(tiles.length - 1)) ...wrapTile(item),
      tiles.last,
    ];
  }
}
