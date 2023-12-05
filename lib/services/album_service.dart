import 'package:dio/dio.dart';
import 'package:flutter_first_app/model/Album.dart';
import 'package:flutter_first_app/services/http_client/dio_client.dart';
import 'package:flutter_first_app/globals.dart' as globals;

class AlbumService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/Albums";
  final String url = globals.baseUrl_;
  static AlbumService? _instance;

  final dio = Dio();

  factory AlbumService() => _instance ??= AlbumService._();

  AlbumService._();

  Future<List<Album>> getAlbums([String userId = ""]) async {
    String appendString = userId == "" ? "" : "?userId=$userId";
    Response<List<dynamic>> response = await HttpClient()
        .httpClient
        .get<List<dynamic>>('${url}albums$appendString');

    if (response.statusCode == 200) {
      final List<dynamic> body = response.data!;
      return body.map((e) => Album.fromJson(e)).toList();
    } else {
      throw "Unable to retrieve Albums";
    }
  }
}
