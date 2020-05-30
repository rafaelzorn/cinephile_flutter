import 'package:flutter/material.dart';
import 'package:cinephile_flutter/resources/colors.dart';

class ScoreWidget extends StatelessWidget {
  final double score;

  ScoreWidget({@required this.score});

  Color _colorScore() {
    Color color = CfColors.LIGHT_GREEN;

    if (score < 5) {
      color = CfColors.LIGHT_RED;
    } else if (score >= 5 && score < 7) {
      color = CfColors.LIGHT_YELLOW;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: _colorScore(),
        ),
        child: Text(
          '$score',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: CfColors.WHITE,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
