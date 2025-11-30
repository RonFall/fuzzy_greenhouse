import 'package:flutter/material.dart';

class AppNavigator {
  static Future<T?> pushScreen<T>(BuildContext context, {required Widget screen, RouteSettings? settings}) async {
    return Navigator.of(context).push<T?>(MaterialPageRoute(builder: (_) => screen, settings: settings));
  }

  static Future<T?> replaceScreen<T extends Object?>(
    BuildContext context, {
    required Widget screen,
    RouteSettings? settings,
  }) async {
    return Navigator.of(context).pushReplacement<T, T>(MaterialPageRoute(builder: (_) => screen, settings: settings));
  }

  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context, {
    required Widget screen,
    RoutePredicate? predicate,
    RouteSettings? settings,
  }) async {
    return Navigator.of(
      context,
    ).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => screen, settings: settings), predicate ?? (route) => false);
  }
}
