import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/strings.dart';

class FilterModalWidget extends StatelessWidget {
  Widget _renderContent() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(22, 22, 22, 18),
            child: Text(
              CfStrings.FILTER,
              style: TextStyle(
                fontSize: 20,
                color: CfColors.DARK_BLUE,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * 0.7),
      color: CfColors.MODAL_BACKGROUND,
      child: Container(
        decoration: BoxDecoration(
          color: CfColors.WHITE,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: _renderContent(),
      ),
    );
  }
}
