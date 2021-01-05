import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/screens/movies/widgets/filter-modal/widgets/filter.dart';

// TODO: Refatorar

class FilterModalWidget extends StatelessWidget {
  Widget _renderOptionSectionTitle(String title) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: CfColors.DARK_BLUE,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderOptions() {
    return Column(
      children: <Widget>[
        _renderOptionSectionTitle(CfStrings.DATE),
        FilterWidget(title: CfStrings.RELEASES, onChanged: () => {}),
        FilterWidget(title: CfStrings.OLD, onChanged: () => {}),
        _renderOptionSectionTitle(CfStrings.POPULARITY),
        FilterWidget(title: CfStrings.MOST_POPULAR, onChanged: () => {}),
        FilterWidget(title: CfStrings.LESS_POPULAR, onChanged: () => {}),
        _renderOptionSectionTitle(CfStrings.REVENUE),
        FilterWidget(title: CfStrings.HIGHER_REVENUE, onChanged: () => {}),
        FilterWidget(title: CfStrings.LOWEST_REVENUE, onChanged: () => {}),
      ],
    );
  }

  Widget _renderButtons() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 5),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: CfColors.DARK_BLUE,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(color: CfColors.DARK_BLUE),
                ),
                color: CfColors.WHITE,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                onPressed: () {},
                child: Text(
                  CfStrings.CONFIRM,
                  style: TextStyle(
                    color: CfColors.WHITE,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(color: CfColors.DARK_BLUE),
                ),
                color: CfColors.DARK_BLUE,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContent() {
    return Column(
      children: <Widget>[
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
        Expanded(
          child: SingleChildScrollView(
            child: _renderOptions(),
          ),
        ),
        _renderButtons(),
      ],
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
