import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/widgets/switch.dart';

// TODO: Refatorar

class FilterWidget extends StatelessWidget {
  final String title;
  final Function onChanged;

  FilterWidget({    
    @required this.title,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: CfColors.DARK_BLUE,
            ),
          ),
          CfSwitchWidget(onChanged: () => {}, value: false)
        ],
      ),
    );
  }
}
