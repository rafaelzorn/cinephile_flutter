import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/genres.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/screens/search/widgets/input-search.dart';

class SearchScreen extends StatelessWidget {

  Widget _renderListGenres() {
    return ListView.builder(
      itemCount: CfGenres.GENRES.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Center(              
              child: Text(
                CfGenres.GENRES[index]['name'], 
                style: TextStyle(fontSize: 18, color: CfColors.DARK_BLUE)
              ),
            ),          
          ),
        );
      },
    );
  }

  Widget _renderContent() {
    return Column(
      children: <Widget>[
        InputSearchWidget(),
        Expanded(
          child: _renderListGenres(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.SEARCH),
      ),
      body: _renderContent(),
    );
  }
}
