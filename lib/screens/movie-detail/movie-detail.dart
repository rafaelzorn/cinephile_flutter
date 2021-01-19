import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:readmore/readmore.dart';
import 'package:share/share.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/involved-types.dart';
import 'package:cinephile_flutter/utils/string.dart';
import 'package:cinephile_flutter/services/api.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';
import 'package:cinephile_flutter/widgets/notification.dart';
import 'package:cinephile_flutter/screens/movie-detail/widgets/poster.dart';
import 'package:cinephile_flutter/screens/movie-detail/widgets/main-info.dart';
import 'package:cinephile_flutter/screens/movie-detail/widgets/involveds/involveds.dart';
import 'package:cinephile_flutter/models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  // Route
  static const String route = '/movie-detail';

  final int id;

  MovieDetailScreen({@required this.id});

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
      final movie = MovieModel.fromJson(jsonMap: movieFromApi);

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
    Share.share(
      '${StringUtils.replace(string: CfStrings.TITLE_SHARE_MOVIE_DETAIL, from: '##title##', replace: 'Título')} \u{1F37F}',
    );
  }

  Widget _renderTitleSection({
    String title,
    double top = 0,
    double bottom = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: top, bottom: bottom),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: CfColors.DARK_BLUE,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderOverview() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ReadMoreText(
        movieDetail.overview,
        trimLines: 3,
        colorClickableText: CfColors.PINK,
        trimMode: TrimMode.Line,
        trimCollapsedText: CfStrings.SHOW_MORE,
        trimExpandedText: CfStrings.SHOW_LESS,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15, color: CfColors.BLUE),
        moreStyle: TextStyle(fontSize: 15, color: CfColors.PINK),
      ),
    );
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
        children: <Widget>[
          PosterWidget(
            backdropPath: movieDetail.backdropPath,
            images: movieDetail.images,
            title: movieDetail.title,
            video: movieDetail.video,
            voteAverage: movieDetail.voteAverage,
          ),
          MainInfoWidget(
            duration: movieDetail.duration,
            genre: movieDetail.genre,
            language: movieDetail.language,
            release: movieDetail.release,
            budget: movieDetail.budget,
            revenue: movieDetail.revenue,
            adult: movieDetail.adult,
          ),
          _renderTitleSection(title: CfStrings.SYNOPSIS, top: 25, bottom: 15),
          _renderOverview(),
          _renderTitleSection(title: CfStrings.MAIN_CAST, bottom: 10),
          InvolvedsWidget(
            involveds: movieDetail.cast,
            involvedType: CfInvolvedTypes.CHARACTER,
          ),
          _renderTitleSection(title: CfStrings.MAIN_TECHNICAL_TEAM, bottom: 10),
          InvolvedsWidget(
            involveds: movieDetail.crew,
            involvedType: CfInvolvedTypes.PRODUCTION_TEAM,
          ),
          _renderTitleSection(title: CfStrings.PRODUCER),
          InvolvedsWidget(
            involveds: movieDetail.productionCompanies,
            involvedType: CfInvolvedTypes.PRODUCER,
          ),
        ],
      ),
    );
  }

  Widget _renderHeaderIcon() {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () => _handleShare(),
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
