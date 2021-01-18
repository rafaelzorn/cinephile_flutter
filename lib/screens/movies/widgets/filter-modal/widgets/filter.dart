import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/widgets/switch.dart';

class FilterWidget extends StatelessWidget {
  final String title;
  final Function onChanged;
  final String checked;
  final String type;

  FilterWidget({
    @required this.title,
    @required this.onChanged,
    @required this.checked,
    @required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 16, color: CfColors.DARK_BLUE),
          ),
          CfSwitchWidget(
            onChanged: this.onChanged,
            value: (this.type == this.checked),
          ),
        ],
      ),
    );
  }
}
