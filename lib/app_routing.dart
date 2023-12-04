import 'package:flutter_first_app/ui/auth/login_page.dart';
import 'package:flutter_first_app/ui/auth/registration_page.dart';
import 'package:flutter_first_app/ui/layout/homepage.dart';
import 'package:flutter_first_app/ui/posts/post_table_dio.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Homepage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/registration',
    builder: (context, state) => const RegistrationPage(),
  ),
  GoRoute(
    path: '/posts',
    builder: (context, state) => const PostTableDio(),
  )
]);

GoRouter router() {
  return _router;
}
