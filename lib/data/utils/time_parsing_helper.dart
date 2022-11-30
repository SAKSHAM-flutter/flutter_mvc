import 'package:intl/intl.dart';
import 'dart:developer' as developer;

class TimeParsingHelper {
  TimeParsingHelper._();

  static final timeFormat = DateFormat('HH:mm');

  ///parses date time from format HH:mm
  ///returns current date time when error occurs
  static DateTime parseDateHHmm(String timeString) {
    return tryParseDateHHmm(timeString) ?? DateTime.now();
  }

  ///parses date time from format HH:mm
  ///returns null if parsing is un successful
  static DateTime? tryParseDateHHmm(String timeString) {
    try {
      return timeFormat.parse(timeString);
    } catch (error, stacktrace) {
      developer.log(
        'error while parsing date in dateTimeFromHHmm function',
        error: error,
        stackTrace: stacktrace,
      );
      return null;
    }
  }

  static String toHHmmString(DateTime dateTime) {
    return timeFormat.format(dateTime);
  }

  static String toHHmmaString(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  ///formats a date to YYYY-MM-dd. For ex: 2022-09-30.
  static String toYYYYMMDD(final DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}