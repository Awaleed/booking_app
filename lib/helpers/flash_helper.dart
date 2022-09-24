import 'dart:async';
import 'dart:collection';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class _MessageItem<T> {
  _MessageItem(this.message) : completer = Completer<Future<T>>();

  final String message;
  Completer<Future<T>> completer;
}

class FlashHelper {
  static Completer<BuildContext> _buildCompleter = Completer<BuildContext>();
  static final _messageQueue = Queue<_MessageItem>();
  static late Completer _previousCompleter;

  static void init(BuildContext context) {
    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.complete(context);
    }
  }

  static void dispose() {
    _messageQueue.clear();

    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.completeError('NotInitialized');
    }
    _buildCompleter = Completer<BuildContext>();
  }

  static Future<T?> toast<T>(String message) async {
    final context = await _buildCompleter.future;

    if (_previousCompleter.isCompleted == false) {
      final item = _MessageItem<T>(message);
      _messageQueue.add(item);
      return await item.completer.future;
    }

    _previousCompleter = Completer();

    Future<T?> showToast(String message) {
      return showFlash<T?>(
        context: context,
        builder: (context, controller) {
          return Flash.dialog(
            controller: controller,
            alignment: const Alignment(0, 0.5),
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            backgroundColor: Colors.black87,
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(message),
              ),
            ),
          );
        },
        duration: const Duration(seconds: 3),
      ).whenComplete(() {
        if (_messageQueue.isNotEmpty) {
          final item = _messageQueue.removeFirst();
          item.completer.complete(showToast(item.message));
        } else {
          _previousCompleter.complete();
        }
      });
    }

    return showToast(message);
  }

  static Future<T?> blockDialog<T>(
    BuildContext context, {
    required Completer<T> dismissCompleter,
  }) {
    final controller = FlashController<T>(
      context,
      builder: (context, FlashController<T> controller) {
        return Flash.dialog(
          controller: controller,
          barrierDismissible: true,
          backgroundColor: Colors.black87,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(strokeWidth: 2.0),
          ),
        );
      },
    );
    dismissCompleter.future.then((value) => controller.dismiss(value));
    return controller.show();
  }

  static Future<T?> blockErrorMessage<T>(
    BuildContext context, {
    required String message,
    required Completer<T> dismissCompleter,
  }) {
    final controller = FlashController<T>(
      context,
      builder: (context, FlashController<T> controller) {
        return Flash.dialog(
          controller: controller,
          barrierDismissible: true,
          backgroundColor: Colors.white,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
    dismissCompleter.future.then((value) => controller.dismiss(value));
    return controller.show();
  }

  static Future<T?> blockSuccessMessage<T>(
    BuildContext context, {
    required String message,
    required Completer<T> dismissCompleter,
  }) {
    final controller = FlashController<T>(
      context,
      builder: (context, FlashController<T> controller) {
        return Flash.dialog(
          controller: controller,
          barrierDismissible: true,
          backgroundColor: Colors.white,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 30,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
    dismissCompleter.future.then((value) => controller.dismiss(value));
    return controller.show();
  }

  static Future<T?> blockMessage<T>(
    BuildContext context, {
    required String message,
    required Completer<T> dismissCompleter,
  }) {
    final controller = FlashController<T>(
      context,
      builder: (context, FlashController<T> controller) {
        return Flash.dialog(
          controller: controller,
          barrierDismissible: true,
          backgroundColor: Colors.white,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
    dismissCompleter.future.then((value) => controller.dismiss(value));
    return controller.show();
  }
}

typedef ChildBuilder<T> = Widget Function(
  BuildContext context,
  FlashController<T> controller,
  StateSetter setState,
);
