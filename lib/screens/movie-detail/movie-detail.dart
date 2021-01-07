import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/widgets/share.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/utils/string.dart';

class MovieDetailScreen extends StatefulWidget {
  // Route
  static const String route = '/movie-detail';

  final Map arguments;

  MovieDetailScreen({
    this.arguments = const {'id': null},
  });

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailScreen> {
  int argumentId;

  @override
  void initState() {
    super.initState();

    this.argumentId = widget.arguments['id'];
  }

  void _handleShare() {
    CfShareWidget.share(
        title:
            '${StringUtils.replace(string: CfStrings.TITLE_SHARE_MOVIE_DETAIL, from: '##title##', replace: 'Título')} \u{1F37F}');
  }

  Widget _renderContent() {
    return Container();
  }

  Widget _renderHeaderIcon() {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () {
        _handleShare();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.MOVIE_DETAILS),
        actions: <Widget>[
          _renderHeaderIcon(),
        ],
      ),
      body: _renderContent(),
    );
  }
}
