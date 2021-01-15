import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';

class CfNotificationWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String textButton;
  final Function onPress;

  CfNotificationWidget({
    @required this.icon,
    @required this.text,
    this.textButton,
    this.onPress,
  });

  Widget _renderButton() {
    if (this.onPress == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => this.onPress(),
        child: FractionallySizedBox(
          widthFactor: 0.50,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: CfColors.LIGHT_GRAY),
            ),
            child: Text(
              this.textButton,
              textAlign: TextAlign.center,
              style: TextStyle(color: CfColors.BLUE),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(this.icon, size: 72, color: CfColors.DARK_BLUE),
          Container(
            padding: EdgeInsets.all(25),
            child: Text(
              this.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, color: CfColors.BLUE),
            ),
          ),
          _renderButton(),
        ],
      ),
    );
  }
}
