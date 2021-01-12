import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

// Cf
import 'package:cinephile_flutter/widgets/share.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/utils/string.dart';
import 'package:cinephile_flutter/services/api.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';
import 'package:cinephile_flutter/widgets/notification.dart';
import 'package:cinephile_flutter/utils/transform.dart';
import 'package:cinephile_flutter/screens/movie-detail/widgets/poster/poster.dart';

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
  static final _api = ApiService.getInstance();

  int argumentId;

  // state
  bool isLoading = false;
  bool isError = false;
  Map<String, dynamic> movieDetail = {};

  @override
  void initState() {
    super.initState();

    this.argumentId = widget.arguments['id'];

    _getMovieDetail();
  }

  Future<void> _getMovieDetail() async {
    setState(() {
      isLoading = true;
    });

    try {
      Map<String, dynamic> params = {
        'include_image_language': 'en,null',
        'append_to_response': 'credits,videos,images',
      };

      Response response =
          await _api.get('movie/${this.argumentId}', queryParameters: params);

      final movieFromApi = JsonDecoder().convert(response.toString());

      setState(() {
        isLoading = false;
        isError = false;
        movieDetail = movieFromApi;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  void _handleShare() {
    CfShareWidget.share(
        title:
            '${StringUtils.replace(string: CfStrings.TITLE_SHARE_MOVIE_DETAIL, from: '##title##', replace: 'Título')} \u{1F37F}');
  }

  Widget _renderContent() {
    if (isLoading) {
      return Center(
        child: SizedBox(height: 40, width: 40, child: CfSpinnerWidget()),
      );
    }

    if (isError) {
      return CfNotificationWidget(
        icon: Icons.report_problem,
        text: CfStrings.SOMETHING_WRONG_HAS_HAPPENED,
        textButton: CfStrings.TRY_AGAIN,
        onPress: _getMovieDetail,
      );
    }

    final Map<String, dynamic> movie = TransformUtils.movie(movie: movieDetail);

    return SingleChildScrollView(
      child: Column(
        children: [
          PosterWidget(
            backdropBath: movie['backdropBath'],
            images: movie['images'],
            title: movie['title'],
            video: movie['video'],
            voteAverage: movie['voteAverage']
          ),
        ],
      ),
    );
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
