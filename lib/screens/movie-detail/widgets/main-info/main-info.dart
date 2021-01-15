import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/strings.dart';

class MainInfoWidget extends StatelessWidget {
  final String duration;
  final String genre;
  final String language;
  final String release;
  final String budget;
  final String revenue;
  final String adult;

  MainInfoWidget({
    @required this.duration,
    @required this.genre,
    @required this.language,
    @required this.release,
    @required this.budget,
    @required this.revenue,
    @required this.adult,
  });

  Widget _renderInformation({String title, String information}) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: CfColors.DARK_BLUE,
              ),
            ),
          ),
          Text(
            information,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              color: CfColors.BLUE,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(children: <Widget>[
        Container(
          width: double.infinity,
          height: 60,
          child: ListView(
            padding: EdgeInsets.only(left: 15),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _renderInformation(
                  title: CfStrings.DURATION, information: this.duration),
              _renderInformation(
                  title: CfStrings.LANGUAGE, information: this.language),
              _renderInformation(
                  title: CfStrings.GENRE, information: this.genre),
              _renderInformation(
                  title: CfStrings.RELEASE, information: this.release),
              _renderInformation(
                  title: CfStrings.BUDGET, information: this.budget),
              _renderInformation(
                  title: CfStrings.REVENUE, information: this.revenue),
              _renderInformation(
                  title: CfStrings.ADULT, information: this.adult),
            ],
          ),
        ),
      ]),
    );
  }
}
