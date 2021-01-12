import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/models/movies.dart';
import 'package:cinephile_flutter/utils/image.dart';
import 'package:cinephile_flutter/utils/genre.dart';
import 'package:cinephile_flutter/utils/date.dart';
import 'package:cinephile_flutter/resources/languages.dart';
import 'package:cinephile_flutter/screens/movies/widgets/movie/widgets/score.dart';
import 'package:cinephile_flutter/resources/images.dart';
import 'package:cinephile_flutter/services/navigation.dart';
import 'package:cinephile_flutter/screens/movie-detail/movie-detail.dart';

class MovieWidget extends StatelessWidget {
  final MoviesModel movie;

  MovieWidget({@required this.movie});

  Widget _renderImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: movie.posterPath != null
          ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: ImageUtils.getImageApi(path: movie.posterPath),
              height: 175,
              width: 115,
              fit: BoxFit.cover,
            )
          : Image.asset(
              CfImages.notFound,
              fit: BoxFit.cover,
              height: 175,
              width: 115,
            ),
    );
  }

  Widget _renderInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
          child: Text(
            '${DateUtils.convertToYear(date: movie.releaseDate)} | ${CfLanguages.LANGUAGES[movie.originalLanguage]}',
            style: TextStyle(fontSize: 15, color: CfColors.BLUE),
          ),
        ),
        Text(
          '${GenreUtils.getGenresById(ids: movie.genreIds)}',
          style: TextStyle(fontSize: 15, color: CfColors.BLUE),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService().navigateTo(MovieDetailScreen.route, arguments: {
          'id': movie.id,
        });
      },
      child: Container(
        height: 175,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Row(
          children: <Widget>[
            _renderImage(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _renderInformation(),
                    Container(
                      child: ScoreWidget(score: movie.voteAverage),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
