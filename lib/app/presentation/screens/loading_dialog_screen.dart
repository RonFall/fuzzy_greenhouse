import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}

class LoadingScreen {
  LoadingScreen._sharedInstance();

  static final LoadingScreen _shared = LoadingScreen._sharedInstance();

  static final LoadingScreen instance = _shared;

  LoadingScreenController? controller;

  void show({required BuildContext context, String text = 'Подождите...'}) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverlay(context: context, text: text);
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController? showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final textController = StreamController<String>();
    textController.add(text);

    final state = Overlay.of(context);
    if (state == null) return null;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: AppColors.accentColor,
                      ),
                      const HeightFiller(16),
                      Text(text, style: AppTextStyle.alertLoadingTextStyle)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);

    return LoadingScreenController(
      close: () {
        textController.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        textController.add(text);
        return true;
      },
    );
  }
}
