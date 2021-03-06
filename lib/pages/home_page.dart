import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liberary_project/providers/books_provider.dart';
import 'package:liberary_project/widgets/book_tile.dart';
import 'package:provider/provider.dart';

import '../models/books.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchControler = TextEditingController();
  String query = "";
  @override
  Widget build(BuildContext context) {
    void search(String query) {
      setState(() {
        this.query = query.toLowerCase();
      });
      // context
      //     .read<BooksProvider>()
      //     .searchBook(searchControler.text.toLowerCase());
    }

    return Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(53, 66, 89, 10),
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
                Image.asset("assets/images/student.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchControler,
                    onChanged: search,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: const Color.fromRGBO(236, 229, 199, 10),
                      hintText: 'Search by title or genre',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(53, 66, 89, 10)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 2, color: Color.fromRGBO(236, 229, 199, 10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 2, color: Color.fromRGBO(236, 229, 199, 10)),
                      ),
                    ),
                  ),
                ),
                //   ],

                Expanded(
                  child: ListView.builder(
                      itemCount: query.isEmpty
                          ? context.watch<BooksProvider>().books.length
                          : searchBook(query).length,
                      itemBuilder: (BuildContext context, int index) {
                        return BookTile(
                            book: query.isEmpty
                                ? context.watch<BooksProvider>().books[index]
                                : searchBook(query)[index]);
                      }),
                ),
              ],
            )));
  }

  List<Books> searchBook(String query) {
    List<Books> filteredList = context
        .watch<BooksProvider>()
        .books
        .where((element) =>
            element.title.toLowerCase().contains(query) ||
            element.genre
                .any((element) => element.toLowerCase().contains(query)))
        .toList();

    return filteredList;
  }
}
