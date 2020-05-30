import 'package:cinephile_flutter/resources/genres.dart';
import 'package:cinephile_flutter/resources/strings.dart';

class GenreUtils {
  static Map<String, Object> getGenreById(id) {
    return CfGenres.GENRES.firstWhere((genre) => genre['id'] == id);
  }

  static String getGenresById(ids) {
    if (ids.length > 1) {
      return '${getGenreById(ids[0])['name']}, ${getGenreById(ids[1])['name']}';
    }

    return ids.length != 0
        ? '${getGenreById(ids[0])['name']}'
        : CfStrings.UNIFORMED;
  }
}
