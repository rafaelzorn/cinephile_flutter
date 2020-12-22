import 'package:flutter/material.dart';

class CfSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: false,
      onChanged: (bool check) {
        print(check);
      },
    );
  }
}
