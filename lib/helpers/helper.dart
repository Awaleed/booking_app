import 'dart:async';

import 'package:flutter/material.dart';

abstract class Helpers {
  static void dismissFauces(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static Future<T?> navigate<T>(BuildContext context, Widget widget) =>
      Navigator.of(context).push<T>(
        MaterialPageRoute<T>(
          builder: (context) => widget,
        ),
      );

  static Future<T?> navigateAllTheWay<T>(BuildContext context, Widget widget) =>
      Navigator.of(context).pushAndRemoveUntil<T>(
        MaterialPageRoute<T>(
          builder: (context) => widget,
        ),
        (route) => false,
      );
}
