class StringUtils {
  static String replace({String string, String from, String replace}) {
    return string.replaceAll(from, replace);
  }

  static dynamic checkEmpty({dynamic value, dynamic dontValue}) {
    return value != '' ? value : dontValue;
  }
}
