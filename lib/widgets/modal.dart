import 'package:flutter/material.dart';

class CfModalWidget {
  static void showModal({BuildContext context, Widget content}) {
    showModalBottomSheet(
        enableDrag: false,
        context: context,
        builder: (_) {
          return content;
        });
  }
}
