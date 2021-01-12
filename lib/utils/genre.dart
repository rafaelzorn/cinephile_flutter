// Cf
import 'package:cinephile_flutter/resources/genres.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/utils/array.dart';

class GenreUtils {
  static Map<String, Object> getGenreById({int id}) {
    return CfGenres.GENRES.firstWhere((genre) => genre['id'] == id);
  }

  static String getGenresById({List ids}) {
    if (ids.length > 1) {
      return '${getGenreById(id: ids[0])['name']}, ${getGenreById(id: ids[1])['name']}';
    }

    return ids.length != 0
        ? '${getGenreById(id: ids[0])['name']}'
        : CfStrings.UNIFORMED;
  }

  static dynamic convertToGenres({List<dynamic> genres}) {
    dynamic itens = ArrayUtils.sliceArrayLength(array: genres, num: 2);

    if (itens.length == 0) {
      return CfStrings.UNIFORMED;
    }

    if (genres.length == 1) {
      itens = genres[0]['name'];
    } else if (genres.length > 1) {
      itens = '${genres[0]['name']} , ${genres[1]['name']}';
    }

    return itens;
  }
}
