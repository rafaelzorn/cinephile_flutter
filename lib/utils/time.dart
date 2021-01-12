// Cf
import 'package:cinephile_flutter/resources/strings.dart';

class TimeUtils {
  static String convertMinsToHrsMins({int time}) {
    if (time == null) {
      return CfStrings.UNIFORMED;
    }

    dynamic hour = (time / 60).floor();
    hour = hour < 10 ? '0$hour' : hour;

    dynamic minutes = time % 60;
    minutes = minutes < 10 ? '0$minutes' : minutes;

    return '${hour}h ${minutes}m';
  }
}
