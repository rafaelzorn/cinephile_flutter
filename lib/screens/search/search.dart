import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/genres.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/type-request.dart';
import 'package:cinephile_flutter/screens/search/widgets/input-search.dart';
import 'package:cinephile_flutter/services/navigation.dart';
import 'package:cinephile_flutter/screens/movies/movies.dart';

class SearchScreen extends StatefulWidget {
  // Route
  static const String route = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void _handleSearch({Map<String, Object> genre}) {
    NavigationService().navigateTo(MoviesScreen.route, arguments: {
      'typeRequest': CfTypeRequest.DISCOVER,
      'name': genre['name'],
      'id': genre['id'],
    });
  }

  Widget _renderListGenres() {
    return ListView.builder(
      itemCount: CfGenres.GENRES.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            _handleSearch(genre: CfGenres.GENRES[index]);
          },
          child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Center(
              child: Text(CfGenres.GENRES[index]['name'],
                  style: TextStyle(fontSize: 18, color: CfColors.DARK_BLUE)),
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
