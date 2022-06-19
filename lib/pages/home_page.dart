import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:liberary_project/providers/books_provider.dart';
import 'package:liberary_project/widgets/book_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchControler = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Librarian"),
        ),
        body: Column(
          children: [
            // Row(
            //   children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchControler,
                decoration: InputDecoration(
                  hintText: 'Search by title or genre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            //   ],
            ElevatedButton(
                onPressed: () {
                  context.push("/w");
                },
                child: const Text("Add New Book")),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<BooksProvider>()
                      .searchBook(searchControler.text.toLowerCase());
                },
                child: const Text("Search")),
            Expanded(
              child: ListView.builder(
                  itemCount: context.watch<BooksProvider>().books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookTile(
                        book: context.watch<BooksProvider>().books[index]);
                  }),
            ),
          ],
        ));
  }
}
