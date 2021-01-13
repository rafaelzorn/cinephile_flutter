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
import 'package:cinephile_flutter/screens/movie-detail/widgets/poster/poster.dart';
import 'package:cinephile_flutter/models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  // Route
  static const String route = '/movie-detail';

  final int id;

  MovieDetailScreen({
    @required this.id,
  });

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailScreen> {
  static final _api = ApiService.getInstance();

  // state
  bool isLoading = false;
  bool isError = false;
  MovieModel movieDetail;

  @override
  void initState() {
    super.initState();

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
          await _api.get('movie/${widget.id}', queryParameters: params);

      final movieFromApi = JsonDecoder().convert(response.toString());
      final movie = MovieModel.fromJson(json: movieFromApi);

      setState(() {
        isLoading = false;
        isError = false;
        movieDetail = movie;
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

    return SingleChildScrollView(
      child: Column(
        children: [
          PosterWidget(
            backdropBath: movieDetail.backdropBath,
            images: movieDetail.images,
            title: movieDetail.title,
            video: movieDetail.video,
            voteAverage: movieDetail.voteAverage
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
