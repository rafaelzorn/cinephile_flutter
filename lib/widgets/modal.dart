import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';

class CfModalWidget {
  static void showModal({BuildContext context, Widget content}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      backgroundColor: CfColors.WHITE,
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (_) => content,
    );
  }
}
