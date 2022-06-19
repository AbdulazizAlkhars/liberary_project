import 'package:flutter/material.dart';
import 'package:liberary_project/pages/home_page.dart';
import 'package:liberary_project/providers/books_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: ((context) => BooksProvider()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
