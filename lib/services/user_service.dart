import 'package:dio/dio.dart';
import 'package:flutter_first_app/model/User.dart';
import 'package:flutter_first_app/services/http_client/dio_client.dart';
import 'package:flutter_first_app/globals.dart' as globals;

class UserService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/users";
  final String url = globals.baseUrl_;
  static UserService? _instance;

  final dio = Dio();

  factory UserService() => _instance ??= UserService._();

  UserService._();

  Future<List<User>> getUsers() async {
    Response<List<dynamic>> response =
        await HttpClient().httpClient.get<List<dynamic>>('${url}users');

    if (response.statusCode == 200) {
      final List<dynamic> body = response.data!;
      return body.map((e) => User.fromJson(e)).toList();
    } else {
      throw "Unable to retrieve users";
    }
  }
}
