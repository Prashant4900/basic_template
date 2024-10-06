import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  // AppLogger Initialize
  static Future<void> init() async {
    try {
      if (kDebugMode) {
        log('AppLogger Initialize');
      } else {
        // App Logger Cloud Initialize
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static void info(Object message, {String name = ''}) {
    if (kDebugMode) {
      log(
        '$message',
        time: DateTime.now(),
        name: name,
      );
    } else {
      // Sync Logs with cloud
    }
  }

  static void error(String message, {String name = ''}) {
    if (kDebugMode) {
      log(
        message,
        time: DateTime.now(),
        name: name,
      );
    } else {
      // Sync Logs with cloud
    }
  }
}
