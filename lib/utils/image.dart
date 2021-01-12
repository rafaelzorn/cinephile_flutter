// Cf
import 'package:cinephile_flutter/utils/array.dart';

class ImageUtils {
  static String getImageApi(
      {String path, String source = 'uri', String width = 'w500'}) {
    return 'https://image.tmdb.org/t/p/$width/$path';
  }

  static List<dynamic> formatImageUrl({List<dynamic> images}) {
    return ArrayUtils.sliceArrayLength(array: images, num: 15)
        .map(
          (item) => getImageApi(
              path: item['file_path'], source: 'url', width: 'original'),
        )
        .toList();
  }
}
