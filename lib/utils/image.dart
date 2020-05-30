class ImageUtils {
  static String getImageApi(
      {String path, String source = 'uri', String width = 'w500'}) {
    return 'https://image.tmdb.org/t/p/$width/$path';
  }
}
