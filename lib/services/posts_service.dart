import 'package:dio/dio.dart';
import 'package:flutter_first_app/model/post.dart';
import 'package:flutter_first_app/services/http_client/dio_client.dart';
import 'package:flutter_first_app/globals.dart' as globals;

class PostService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";
  final String url = globals.baseUrl_;
  static PostService? _instance;

  final dio = Dio();

  factory PostService() => _instance ??= PostService._();

  PostService._();

  Future<List<Post>> getPosts([String userId = ""]) async {
    String appendString = userId == "" ? "" : "?userId=$userId";
    Response<List<dynamic>> response = await HttpClient()
        .httpClient
        .get<List<dynamic>>('${url}posts$appendString');

    if (response.statusCode == 200) {
      final List<dynamic> body = response.data!;
      return body.map((e) => Post.fromJson(e)).toList();
    } else {
      throw "Unable to retrieve todos";
    }
  }
}
