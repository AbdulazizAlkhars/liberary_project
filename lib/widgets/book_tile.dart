import 'package:flutter/material.dart';
import 'package:liberary_project/models/books.dart';
import 'dart:math';

import 'package:liberary_project/providers/books_provider.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  final Books book;
  const BookTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List colors = [
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.green,
      Colors.yellow,
    ];

    // Random random = new Random();
    return Card(
        color: colors[book.id],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${book.id}- ${book.title}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                Text(
                  "Aauthor: ${book.author} and \n Genre: ${book.genre}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 126, 126, 126)),
                ),
                Text("Borrowed By: ${book.borrowedBy}"),
                const Divider(
                  // height: 20,
                  // thickness: 5,
                  // indent: 20,
                  // endIndent: 0,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.available ? "Available" : "Not Available",
                      style: TextStyle(
                          color: book.available ? Colors.green : Colors.red),
                    ),
                    SizedBox(
                        width: 70,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<BooksProvider>()
                                .borrowBook(id: book.id);
                          },
                          child: const Text(
                            "Borrow",
                            style: TextStyle(fontSize: 11),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
