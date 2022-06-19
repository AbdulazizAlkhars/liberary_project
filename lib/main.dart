import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liberary_project/pages/add_books.dart';
import 'package:liberary_project/pages/home_page.dart';
import 'package:liberary_project/providers/books_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: ((context) => BooksProvider()), child: MyApp()));
}

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => HomePage()),
  GoRoute(path: "/w", builder: (context, state) => AddBook())
]);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
