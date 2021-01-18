// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/utils/image.dart';
import 'package:cinephile_flutter/utils/array.dart';
import 'package:cinephile_flutter/utils/time.dart';
import 'package:cinephile_flutter/utils/genre.dart';
import 'package:cinephile_flutter/resources/languages.dart';
import 'package:cinephile_flutter/utils/date.dart';
import 'package:cinephile_flutter/utils/currency.dart';
import 'package:cinephile_flutter/utils/string.dart';

class MovieModel {
  final String title;
  final String backdropPath;
  final dynamic video;
  final String overview;
  final List<dynamic> images;
  final double voteAverage;
  final List<dynamic> cast;
  final List<dynamic> crew;
  final List<dynamic> productionCompanies;
  final String duration;
  final String genre;
  final String language;
  final String release;
  final String budget;
  final String revenue;
  final String adult;

  MovieModel({
    this.title,
    this.backdropPath,
    this.video,
    this.overview,
    this.images,
    this.voteAverage,
    this.cast,
    this.crew,
    this.productionCompanies,
    this.duration,
    this.genre,
    this.language,
    this.release,
    this.budget,
    this.revenue,
    this.adult,
  });

  factory MovieModel.fromJson({Map<String, dynamic> jsonMap}) {

    print(jsonMap);

    return MovieModel(
      title: StringUtils.checkEmpty(
        value: jsonMap['title'],
        dontValue: CfStrings.UNIFORMED,
      ),
      backdropPath: jsonMap['backdrop_path'],
      video: ArrayUtils.checkValueExistInArray(
        array: jsonMap['videos']['results'],
        dontValue: null,
      ),
      overview: StringUtils.checkEmpty(
        value: jsonMap['overview'],
        dontValue: CfStrings.UNIFORMED,
      ),
      images: ImageUtils.formatImageUrl(images: jsonMap['images']['backdrops']),
      voteAverage: StringUtils.checkEmpty(
        value: jsonMap['vote_average'],
        dontValue: 0,
      ),
      cast: ArrayUtils.sliceArrayLength(
        array: jsonMap['credits']['cast'],
        num: 15,
      ),
      crew: ArrayUtils.sliceArrayLength(
        array: jsonMap['credits']['crew'],
        num: 15,
      ),
      productionCompanies: ArrayUtils.sliceArrayLength(
        array: jsonMap['production_companies'],
        num: 10,
      ),
      duration: TimeUtils.convertMinsToHrsMins(time: jsonMap['runtime']),
      genre: GenreUtils.convertToGenres(genres: jsonMap['genres']),
      language: CfLanguages.LANGUAGES[jsonMap['original_language']] ??
          CfStrings.UNIFORMED,
      release: DateUtils.convertToDate(date: jsonMap['release_date']),
      budget: CurrencyUtils.convertToDolar(value: jsonMap['budget']),
      revenue: CurrencyUtils.convertToDolar(value: jsonMap['revenue']),
      adult: jsonMap['adult'] ? CfStrings.YES : CfStrings.NO,
    );
  }
}
