import 'dart:developer';
import 'package:flutter/foundation.dart';

class LogUtility {
  static void logMap(Map<String, String> logs) {
    logs.forEach((key, value) {
      logInfo('[$key] ${value.toString()}');
    });
  }

  static void logList(List<String> logs) {
    for (var element in logs) {
      if (kDebugMode) logInfo(element);
    }
  }

  static void logInfo(dynamic message, {String label = 'info_log'}) {
    if (kDebugMode) log('$message', name: 'INFO_LOG|${label.toUpperCase()}');
  }

  static void logSuccess(dynamic message, {String label = 'success_log'}) {
    if (kDebugMode) log('$message', name: 'SUCCESS_LOG|${label.toUpperCase()}');
  }

  static void logWarning(dynamic message, {String label = 'warning_log'}) {
    if (kDebugMode) log('$message', name: 'WARNING_LOG|${label.toUpperCase()}');
  }

  static void logError(dynamic message, {String label = 'error_log'}) {
    if (kDebugMode) log('$message', name: 'ERROR_LOG|${label.toUpperCase()}');
  }
}
