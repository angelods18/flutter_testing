import 'package:flutter_first_app/ui/auth/registration_page.dart';
import 'package:flutter_first_app/ui/layout/homepage.dart';
import 'package:flutter_first_app/ui/posts/post_table_dio.dart';
import 'package:flutter_first_app/ui/user/user_profile.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const Homepage(defaultTab: 2),
      routes: [
        GoRoute(
            name: 'profile',
            path: 'profile',
            builder: (context, state) => const UserProfile())
      ]),
  GoRoute(
    name: 'registration',
    path: '/registration',
    builder: (context, state) => const RegistrationPage(),
  ),
  GoRoute(
    name: 'posts',
    path: '/posts',
    builder: (context, state) => const PostTableDio(),
  )
]);

GoRouter router() {
  return _router;
}
