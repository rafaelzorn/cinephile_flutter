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

  static String convertToDate({String date}) {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
  }

  static String getAge({String birthday}) {
    if (birthday == null) {
      return '${CfStrings.UNIFORMED} age';
    }

    final DateTime birthDate = DateTime.parse(birthday);
    final DateTime today = DateTime.now();
    
    int age = today.year - birthDate.year;
    final int month = today.month - birthDate.month;

    if (month < 0 || (month == 0 && today.day < birthDate.day)) {
      age -= 1;
    }

    return '$age years';
  }
}
