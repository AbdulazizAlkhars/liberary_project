import 'package:flutter/material.dart';
import 'package:liberary_project/models/books.dart';
import 'dart:math';

import 'package:liberary_project/providers/books_provider.dart';
import 'package:liberary_project/providers/members_provider.dart';
import 'package:provider/provider.dart';
import 'package:from_css_color/from_css_color.dart';

class BookTile extends StatelessWidget {
  final Books book;
  const BookTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List colors = [
    //   fromCssColor("#ffebe5"),
    //   fromCssColor("#fdf0da"),
    //   fromCssColor("#fdf0da"),
    //   fromCssColor("#d9f6f4"),
    // ];

    // Random random = new Random();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
          color: Color.fromARGB(255, 234, 230, 213),
          // color: colors[Random().nextInt(colors.length)],
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: SizedBox(
              // height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${book.id}- ${book.title}",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(246, 34, 53, 85))),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Aauthor: ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color.fromRGBO(53, 66, 89, 10),
                              fontSize: 12),
                        ),
                        Text(
                          book.author,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromRGBO(53, 66, 89, 10),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Genre: ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(53, 66, 89, 10)),
                          ),
                          TextSpan(
                            text: book.genre.join(', ').toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(53, 66, 89, 10)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Borrowed By: ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(53, 66, 89, 10)),
                        ),
                        TextSpan(
                          text: context
                              .watch<MemberProvider>()
                              .getMembersName(book.borrowedBy)
                              .join(', ')
                              .toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(53, 66, 89, 10)),
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //     "Borrowed By: ${context.watch<BooksProvider>().getMembersName(book.borrowedBy)}"),
                  const Divider(
                    color: Color.fromRGBO(53, 66, 89, 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.available ? "Available" : "Not Available",
                            style: TextStyle(
                                color:
                                    book.available ? Colors.green : Colors.red),
                          ),
                          Text(
                            !book.available && book.borrowedBy.isNotEmpty
                                ? context
                                    .watch<MemberProvider>()
                                    .getMemberName(book.borrowedBy.last)
                                    .toString()
                                : "",
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(53, 66, 89, 10)),
                          ),
                        ],
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
                            child: Text(
                              book.available ? "Borrow" : "Return",
                              style: const TextStyle(fontSize: 11),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(205, 194, 174, 10)),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
