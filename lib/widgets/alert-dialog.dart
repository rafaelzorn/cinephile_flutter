import 'package:flutter/material.dart';

class CfAlertDialogWidget {
  static void alertDialog({
    BuildContext context,
    String title,
    String content,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(title: Text(title), content: Text(content)),
    );
  }
}
