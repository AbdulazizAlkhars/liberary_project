import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:liberary_project/providers/books_provider.dart';

import 'package:provider/provider.dart';

class AddBook extends StatelessWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addTitle = TextEditingController();
    var addAuthor = TextEditingController();
    var addGenre = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Librarian"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: addTitle,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: addAuthor,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  hintText: 'Author',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                      )))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: addGenre,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  hintText: 'Genre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                      )))),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<BooksProvider>().addBook(
                  title: addTitle.text,
                  author: addAuthor.text,
                  genre: addGenre.text);
              context.pop();
            },
            child: const Text("Add New Book"))
      ]),
    );
  }
}
