import 'dart:math';

class Constants {
  static const int numberOfHours = 10;
  static const int numberOfMinutes = 100;
  static const int numberOfSeconds = 10;
  static const double angleBetweenEachMinuteLine = (2 * pi) / numberOfMinutes;
  static const double angleBetweenEachHourLine = 5 * angleBetweenEachMinuteLine;
}
