// Cf
import 'package:cinephile_flutter/resources/genres.dart';
import 'package:cinephile_flutter/resources/strings.dart';

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
}
