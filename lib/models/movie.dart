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
  final String backdropBath;
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
    this.backdropBath,
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

  factory MovieModel.fromJson({Map<String, dynamic> json}) {    
    return MovieModel(
      title: StringUtils.checkEmpty(value: json['title'], dontValue: ''),
      backdropBath: StringUtils.checkEmpty(value: json['backdrop_path'], dontValue: ''),
      video: ArrayUtils.checkValueExistInArray(
          array: json['videos']['results'], dontValue: null),
      overview:
          StringUtils.checkEmpty(value: json['overview'], dontValue: CfStrings.UNIFORMED),
      images: ImageUtils.formatImageUrl(images: json['images']['backdrops']),
      voteAverage: StringUtils.checkEmpty(value: json['vote_average'], dontValue: 0),
      cast:
          ArrayUtils.sliceArrayLength(array: json['credits']['cast'], num: 15),
      crew:
          ArrayUtils.sliceArrayLength(array: json['credits']['crew'], num: 15),
      productionCompanies: ArrayUtils.sliceArrayLength(
          array: json['production_companies'], num: 10),
      duration: TimeUtils.convertMinsToHrsMins(time: json['runtime']),
      genre: GenreUtils.convertToGenres(genres: json['genres']),
      language: CfLanguages.LANGUAGES[json['original_language']],
      release: DateUtils.convertToDate(date: json['release_date']),
      budget: CurrencyUtils.convertToDolar(value: json['budget']),
      revenue: CurrencyUtils.convertToDolar(value: json['revenue']),
      adult: json['adult'] ? CfStrings.YES : CfStrings.NO,
    );
  }
}
