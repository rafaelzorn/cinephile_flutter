// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/utils/image.dart';
import 'package:cinephile_flutter/utils/array.dart';
import 'package:cinephile_flutter/utils/time.dart';
import 'package:cinephile_flutter/utils/genre.dart';
import 'package:cinephile_flutter/resources/languages.dart';
import 'package:cinephile_flutter/utils/date.dart';
import 'package:cinephile_flutter/utils/currency.dart';

class TransformUtils {
  static Map<String, dynamic> movie({Map<String, dynamic> movie}) {
    return {
      'title': movie['title'] != '' ? movie['title'] : '',
      'backdropBath':
          movie['backdrop_path'] != '' ? movie['backdrop_path'] : '',
      'video': movie['videos']['results'].asMap().containsKey(0)
          ? movie['videos']['results'][0]
          : null,
      'overview':
          movie['overview'] != '' ? movie['overview'] : CfStrings.UNIFORMED,
      'images': ImageUtils.formatImageUrl(images: movie['images']['backdrops']),
      'voteAverage': movie['vote_average'] != '' ? movie['vote_average'] : 0,
      'cast':
          ArrayUtils.sliceArrayLength(array: movie['credits']['cast'], num: 15),
      'crew':
          ArrayUtils.sliceArrayLength(array: movie['credits']['crew'], num: 15),
      'productionCompanies': ArrayUtils.sliceArrayLength(
          array: movie['production_companies'], num: 10),
      'infosDetail': {
        'Duration': TimeUtils.convertMinsToHrsMins(time: movie['runtime']),
        'Genre': GenreUtils.convertToGenres(genres: movie['genres']),
        'Language': CfLanguages.LANGUAGES[movie['original_language']],
        'Release': DateUtils.convertToDate(date: movie['release_date']),
        'Budget': CurrencyUtils.convertToDolar(value: movie['budget']),
        'Revenue': CurrencyUtils.convertToDolar(value: movie['revenue']),
        'Adult': movie['adult'] ? CfStrings.YES : CfStrings.NO,
      }
    };
  }
}
