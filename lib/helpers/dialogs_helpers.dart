import 'dart:async';

import 'package:flutter/material.dart' as material;
import 'package:supercharged/supercharged.dart';

import 'flash_helper.dart';

abstract class DialogsHelpers {
  static void _dismissFauces(material.BuildContext context) =>
      material.FocusScope.of(context).unfocus();

  static Completer _createCompleter(int duration) {
    final completer = Completer();
    Future.delayed(duration.seconds).then((_) => completer.complete());
    return completer;
  }

  static Future showMustLoginDialog(
      material.BuildContext context, material.Widget loginWidget) {
    _dismissFauces(context);

    return material.showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => loginWidget,
    );
  }

  static Future showDialog(
    material.BuildContext mContext, {
    String? title,
    String? message,
    String? confirmationTitle,
    String? cancelTitle,
    void Function()? confirmationCallback,
    void Function()? cancelCallback,
  }) {
    _dismissFauces(mContext);
    material.Widget backButton(context) => material.TextButton(
          onPressed: () {
            material.Navigator.of(context).pop();
            cancelCallback?.call();
          },
          child: material.Text(cancelTitle ?? 'Back'),
        );

    material.Widget okButton(context) => material.TextButton(
          onPressed: () {
            material.Navigator.of(context).pop();
            confirmationCallback?.call();
          },
          child: material.Text(confirmationTitle ?? 'Confirm'),
        );

    material.Widget alert(context) => material.AlertDialog(
          title: title == null
              ? null
              : title == 'Something went wrong'
                  ? const material.Center(
                      child: material.Icon(
                        material.Icons.warning,
                        color: material.Colors.red,
                      ),
                    )
                  : material.Text(title),
          content: message == null ? null : material.Text(message),
          actions: [
            backButton(context),
            if (confirmationCallback != null) okButton(context)
          ],
          shape: material.RoundedRectangleBorder(
            borderRadius: material.BorderRadius.circular(25),
          ),
        );

    return material.showDialog(
      context: mContext,
      builder: (context) => alert(context),
    );
  }

  static Future showMessageDialog(
    material.BuildContext context, {
    String? message,
    void Function()? confirmationCallback,
  }) =>
      showDialog(
        context,
        message: message,
        confirmationCallback: confirmationCallback,
      );
  static Future showWarningDialog(
    material.BuildContext context, {
    String? message,
    void Function()? confirmationCallback,
  }) =>
      showDialog(
        context,
        title: '${'Warning'}...',
        message: message,
        confirmationCallback: confirmationCallback,
      );
  static Future showErrorDialog(
    material.BuildContext context, {
    String? message,
    void Function()? confirmationCallback,
  }) =>
      showDialog(
        context,
        title: 'Something went wrong',
        message: message,
        confirmationCallback: confirmationCallback,
      );

  static Future showMessageOverlay(
    material.BuildContext context,
    String message, {
    int duration = 3,
  }) {
    _dismissFauces(context);
    final completer = _createCompleter(duration);
    FlashHelper.blockMessage(
      context,
      message: message,
      dismissCompleter: completer,
    );
    return completer.future;
  }

  static Future<void> showSuccessOverlay(
    material.BuildContext context,
    String message, {
    int duration = 3,
  }) {
    _dismissFauces(context);
    final completer = _createCompleter(duration);
    FlashHelper.blockSuccessMessage(
      context,
      message: message,
      dismissCompleter: completer,
    );
    return completer.future;
  }

  static Future showErrorOverlay(
    material.BuildContext context,
    String message, {
    int duration = 3,
  }) {
    _dismissFauces(context);
    final completer = _createCompleter(duration);
    Future.delayed(duration.seconds).then((_) => completer.complete());
    FlashHelper.blockErrorMessage(
      context,
      message: message,
      dismissCompleter: completer,
    );
    return completer.future;
  }

  static Completer showLoading(material.BuildContext context) {
    final completer = _createCompleter(3);
    FlashHelper.blockDialog(context, dismissCompleter: completer);
    return completer;
  }
}
