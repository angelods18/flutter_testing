import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RouterApp extends StatelessWidget {
  const RouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RouterState(),
      child: MaterialApp.router(
        title: 'Router demo',
        theme: ThemeData.dark(useMaterial3: true),
        routerConfig: router(),
      ),
    );
  }
}

class RouterState extends ChangeNotifier {}

GoRouter router() {
  return GoRouter(initialLocation: '/login', routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/catalog',
      builder: (context, state) => const CatalogPage(),
    ),
  ]);
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catalog')),
      body: Center(
        child: Column(
          children: [Text('catalog')],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(),
            ElevatedButton(
                onPressed: () {
                  log('Tentativo di login');
                  context.push('/catalog');
                  // context.pushReplacement('/catalog');
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Username'),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Password'),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
