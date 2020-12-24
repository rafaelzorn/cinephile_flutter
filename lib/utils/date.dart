import 'package:intl/intl.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';

class DateUtils {
  static String currentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static String convertToYear({String date}) {
    if (date == '') {
      return CfStrings.UNIFORMED;
    }

    return DateFormat('yyyy').format(DateTime.parse(date));
  }
}
