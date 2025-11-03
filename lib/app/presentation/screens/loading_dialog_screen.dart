import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';

@immutable
final class LoadingScreenController {
  const LoadingScreenController({required this.close, required this.update});

  final VoidCallback close;
  final ValueChanged<String> update;
}

class LoadingScreen {
  LoadingScreen._sharedInstance();

  static final LoadingScreen _shared = LoadingScreen._sharedInstance();

  static final LoadingScreen instance = _shared;

  LoadingScreenController? _controller;

  void show(BuildContext context, {String text = 'Подождите...'}) {
    _controller = showOverlay(context, text: text);
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingScreenController? showOverlay(BuildContext context, {required String text}) {
    final textController = StreamController<String>();
    textController.add(text);

    final state = Overlay.of(context);
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(color: AppColors.accentColor),
                      const SizedBox(height: 16),
                      Text(text, style: AppTextStyle.alertTextStyle),
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
      },
      update: (text) => textController.add(text),
    );
  }
}
