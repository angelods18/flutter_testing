import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);



  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    print(err.message);
  }
}
