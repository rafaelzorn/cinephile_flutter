import 'package:flutter/material.dart';

class CfSpinnerWidget extends StatelessWidget {
  final double strokeWidth;

  CfSpinnerWidget({this.strokeWidth: 4});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
    );
  }
}
