import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';

class CfSpinnerWidget extends StatelessWidget {
  final double strokeWidth;
  final Color color;

  CfSpinnerWidget({this.strokeWidth: 4, this.color: CfColors.DARK_BLUE});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation<Color>(this.color),
    );
  }
}
