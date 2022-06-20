import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liberary_project/pages/add_books.dart';
import 'package:liberary_project/pages/add_member.dart';
import 'package:liberary_project/pages/home_page.dart';
import 'package:liberary_project/pages/members_list.dart';
import 'package:liberary_project/providers/books_provider.dart';
import 'package:liberary_project/providers/members_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => BooksProvider())),
    ChangeNotifierProvider(create: ((context) => MemberProvider()))
  ], child: const MyApp()));
}

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const HomePage()),
  GoRoute(path: "/add-book", builder: (context, state) => const AddBook()),
  GoRoute(path: "/members", builder: (context, state) => const Members()),
  GoRoute(path: "/add-member", builder: (context, state) => const AddMember())
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
