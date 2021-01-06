import 'package:flutter/material.dart';

class UnfocusHelpers {
  static void unfocus({BuildContext context}) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
