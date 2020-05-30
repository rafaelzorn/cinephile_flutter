import 'package:intl/intl.dart';

class DateUtils {
  static String currentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static String convertToYear(date) {
    return DateFormat('yyyy').format(DateTime.parse(date));
  }
}
