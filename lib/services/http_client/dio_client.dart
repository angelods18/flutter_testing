import 'package:dio/dio.dart';
import 'package:flutter_first_app/services/http_client/dio_interceptor.dart';
import '../../globals.dart' as globals;

class HttpClient {
  final httpClient = createDioClient();
  final token = Dio(BaseOptions(baseUrl: globals.baseUrl_));

  HttpClient._internal();

  static final _singleton = HttpClient._internal();

  factory HttpClient() => _singleton;

  static Dio createDioClient() {
    var dio = Dio(BaseOptions(
      baseUrl: globals.baseUrl_,
      receiveTimeout: Duration(seconds: 15),
      connectTimeout: Duration(seconds: 15),
      // sendTimeout: Duration(seconds: 15)
    ));

    dio.interceptors.addAll({AppInterceptors(dio)});
    return dio;
  }
}
