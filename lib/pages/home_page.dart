import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liberary_project/providers/books_provider.dart';
import 'package:liberary_project/widgets/book_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void search(String query) {
      context
          .read<BooksProvider>()
          .searchBook(searchControler.text.toLowerCase());
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Librarian"),
          leading: IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Members list',
            onPressed: () {
              context.push("/members");
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Show Snackbar',
              onPressed: () {
                context.push("/add-book");
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Row(
            //   children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchControler,
                onChanged: search,
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
