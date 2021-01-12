import 'package:intl/intl.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';

class CurrencyUtils {
  static String convertToDolar({int value}) {
    final format = new NumberFormat("#,##0.00", "en_US");

    if (value == null) {
      return CfStrings.UNIFORMED;
    }

    return '\$${format.format(value)}';
  }
}
