import 'package:liberary_project/models/members.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books_provider.dart';

class MemberTile extends StatelessWidget {
  final Member member;
  const MemberTile({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${member.id}- ${member.firstName} ${member.lastName}"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Curently Borrowing: ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          TextSpan(
                            text: context
                                .watch<BooksProvider>()
                                .getBooksTitle(member.currentlyBorrowedBooks)
                                .join(', ')
                                .toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 126, 126, 126)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "MemberSip: ",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            TextSpan(
                              text: member.membership,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 126, 126, 126)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
