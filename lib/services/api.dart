import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static final String _apiToken = DotEnv().env['IMDB_TOKEN'];

  static final BaseOptions _options = new BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    connectTimeout: 10000,
    receiveTimeout: 5000,
    contentType: 'application/json',
    headers: {
      'Authorization': 'Bearer $_apiToken',
    },
  );

  static final Dio _dio = new Dio(_options);

  static Dio getInstance() {
    return _dio;
  }
}
