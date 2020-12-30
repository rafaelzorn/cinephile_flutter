import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/type-request.dart';
import 'package:cinephile_flutter/services/api.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';
import 'package:cinephile_flutter/widgets/notification.dart';
import 'package:cinephile_flutter/screens/movies/widgets/movie/movie.dart';
import 'package:cinephile_flutter/models/movie.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/utils/date.dart';
import 'package:cinephile_flutter/store/mobx.dart';
import 'package:cinephile_flutter/widgets/modal.dart';
import 'package:cinephile_flutter/screens/movies/widgets/filter-modal/filter-modal.dart';

class MoviesScreen extends StatefulWidget {
  // Route
  static String route = '/movies';

  final Map arguments;

  MoviesScreen({
    this.arguments = const {
      'id': null,
      'name': null,
      'typeRequest': CfTypeRequest.DISCOVER
    },
  });

  @override
  _MoviesScreenState createState() => _MoviesScreenState(this.arguments);
}

class _MoviesScreenState extends State<MoviesScreen> {
  static final _api = ApiService.getInstance();

  final Map arguments;

  AsMobx _mobx = AsMobx();

  // state
  List<MovieModel> movies = [];
  bool isLoading = false;
  bool isLoadingMore = false;
  bool isRefresh = false;
  bool isError = false;
  int page = 1;
  int totalPages = 0;

  _MoviesScreenState(this.arguments);

  @override
  void initState() {
    super.initState();

    _getMovies();  
  }

  Map<String, dynamic> _getQueryRequest() {
    Map<String, dynamic> params = {
      'page': page.toString(),
      'sort_by': 'popularity.desc',
      'with_release_type': '1|2|3|4|5|6|7',
      'release_date.lte': DateUtils.currentDate(),
      'include_adult': _mobx.configurationStore.hasAdultContent,
    };

    if (this.arguments['typeRequest'] == CfTypeRequest.DISCOVER) {
      params.addAll(this.arguments['id'] != null
          ? {'with_genres': this.arguments['id']}
          : {});
    }

    if (this.arguments['typeRequest'] == CfTypeRequest.SEARCH) {
      params.addAll({'query': this.arguments['name'].trim()});
    }

    return params;
  }

  Future<void> _getMovies() async {
    setState(() {
      isLoading = true;
    });

    try {
      Response response = await _api.get(
          '${this.arguments['typeRequest']}/movie',
          queryParameters: _getQueryRequest());

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

  Future<void> _handleLoadMoreMovies() async {
    int nextPage = page + 1;

    setState(() {
      isLoadingMore = true;
      page = nextPage;
    });

    _getMovies();
  }

  void _handleFilterModalOpen() {
    CfModalWidget.showModal(context: context, content: FilterModalWidget());
  }

  Widget _renderMovie({BuildContext context, int index}) {
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

  Widget _renderHeaderTitle() {
    if (this.arguments['name'] != null) {
      return Text(this.arguments['name']);
    }

    return Text(CfStrings.HOME);
  }

  Widget _renderHeaderIcon() {
    if (this.arguments['typeRequest'] == CfTypeRequest.DISCOVER) {
      return IconButton(
        icon: Icon(Icons.filter_list),
        onPressed: () {
          _handleFilterModalOpen();
        },
      );
    }

    return Container();
  }

  Widget _renderContent() {
    if (isLoading && !isLoadingMore && !isRefresh) {
      return Center(
        child: SizedBox(height: 40, width: 40, child: CfSpinnerWidget()),
      );
    }

    if (isError) {
      return CfNotificationWidget(
        icon: Icons.report_problem,
        text: CfStrings.SOMETHING_WRONG_HAS_HAPPENED,
        textButton: CfStrings.TRY_AGAIN,
        onPress: _getMovies,
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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Text(
            this.arguments['typeRequest'] == CfTypeRequest.DISCOVER
                ? CfStrings.MOST_POPULAR
                : this.arguments['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) => _renderMovie(
                context: context,
                index: index,
              ),
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
        title: _renderHeaderTitle(),
        actions: <Widget>[
          _renderHeaderIcon(),
        ],
      ),
      body: _renderContent(),
    );
  }
}
