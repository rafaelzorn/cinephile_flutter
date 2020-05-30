import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/services/api.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';
import 'package:cinephile_flutter/widgets/notification.dart';
import 'package:cinephile_flutter/pages/movies/widgets/movie/movie.dart';
import 'package:cinephile_flutter/models/movie.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/utils/date.dart';

class MoviesPage extends StatefulWidget {
  // route
  static final String route = '/movies';

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  static final _api = ApiService.getInstance();

  // state
  List<MovieModel> movies = [];
  bool isLoading = false;
  bool isLoadingMore = false;
  bool isRefresh = false;
  bool isError = false;
  int page = 1;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();

    _getMovies();
  }

  void _getMovies() async {
    setState(() {
      isLoading = true;
    });

    try {
      Response response = await _api.get('discover/movie', queryParameters: {
        'page': page.toString(),
        'with_release_type': '1|2|3|4|5|6|7',
        'release_date.lte': DateUtils.currentDate(),
      });

      final moviesFromApi = JsonDecoder().convert(response.toString());

      if (isRefresh) {
        setState(() {
          movies = [];
        });
      }

      moviesFromApi['results'].forEach((movie) {
        movies.add(MovieModel.fromJson(movie));
      });

      setState(() {
        isLoading = false;
        isLoadingMore = false;
        isRefresh = false;
        isError = false;
        totalPages = moviesFromApi['total_pages'];
        movies = movies;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        isLoadingMore = false;
        isRefresh = false;
        isError = true;
      });
    }
  }

  Future<void> _handleRefreshMovies() async {
    setState(() {
      isRefresh = true;
      page = 1;
    });

    _getMovies();
  }

  void _handleTryAgainLoadMovies() {
    setState(() {
      page = 1;
      movies = [];
    });

    _getMovies();
  }

  void _handleLoadMoreMovies() {
    int nextPage = page + 1;

    setState(() {
      isLoadingMore = true;
      page = nextPage;
    });

    _getMovies();
  }

  Widget _renderMovie(BuildContext context, int index) {
    if (index == movies.length) {
      return _renderFooter();
    }

    return MovieWidget(movie: movies[index]);
  }

  Widget _renderFooter() {
    if (totalPages == page) {
      return null;
    }

    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: FractionallySizedBox(
        widthFactor: 0.50,
        child: InkWell(
          onTap: () {
            _handleLoadMoreMovies();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: CfColors.LIGHT_GRAY),
            ),
            child: !isLoadingMore
                ? Text(CfStrings.LOAD_MORE, textAlign: TextAlign.center)
                : Center(
                    child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CfSpinnerWidget(strokeWidth: 1),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _renderContent() {
    if (isLoading && !isLoadingMore && !isRefresh) {
      return Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CfSpinnerWidget(),
        ),
      );
    }

    if (isError) {
      return CfNotificationWidget(
        icon: Icons.report_problem,
        text: CfStrings.SOMETHING_WRONG_HAS_HAPPENED,
        textButton: CfStrings.TRY_AGAIN,
        onPress: _handleTryAgainLoadMovies,
      );
    }

    if (movies.length == 0) {
      return CfNotificationWidget(
        icon: Icons.thumb_down,
        text: CfStrings.NO_RESULTS_AVAILABLE,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          child: Text(
            CfStrings.MOST_POPULAR,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: _renderMovie,
              itemCount: movies.length + 1,
            ),
            onRefresh: _handleRefreshMovies,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.HOME),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: _renderContent(),
    );
  }
}
