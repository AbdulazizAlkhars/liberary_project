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
        TextField(
          controller: addTitle,
          decoration: InputDecoration(
            hintText: 'Add title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
          ),
        ),
        TextField(
            controller: addAuthor,
            decoration: InputDecoration(
                hintText: 'Add Author',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                    )))),
        TextField(
            controller: addGenre,
            decoration: InputDecoration(
                hintText: 'Add Genre',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                    )))),
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
