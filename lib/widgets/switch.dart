import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';

class CfSwitchWidget extends StatelessWidget {
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeColor;
  final Function onChanged;
  final bool value;

  CfSwitchWidget({
    this.activeTrackColor = CfColors.DARK_BLUE,
    this.inactiveTrackColor = CfColors.GRAY,
    this.activeColor = CfColors.CYAN,
    @required this.onChanged,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: this.activeTrackColor,
      inactiveTrackColor: this.inactiveTrackColor,
      activeColor: this.activeColor,
      value: this.value,
      onChanged: (check) => this.onChanged(),
    );
  }
}
