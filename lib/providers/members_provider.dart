import 'package:liberary_project/models/members.dart';

class MemberProvider {
  List<Member> members = [
    Member(
        id: 1,
        firstName: "Aziz",
        lastName: "AlSaffar",
        currentlyBorrowedBooks: [3, 9],
        membership: "gold"),
    Member(
        id: 2,
        firstName: "Hashim",
        lastName: "Behbehani",
        currentlyBorrowedBooks: [5],
        membership: "gold"),
    Member(
        id: 3,
        firstName: "Alhamza",
        lastName: "Abdulmonem",
        currentlyBorrowedBooks: [1, 2],
        membership: "silver"),
    Member(
        id: 4,
        firstName: "Reem",
        lastName: "AlHasawi",
        currentlyBorrowedBooks: [],
        membership: "platinum"),
    Member(
        id: 5,
        firstName: "Laila",
        lastName: "AlKandery",
        currentlyBorrowedBooks: [10, 7, 8],
        membership: "platinum"),
  ];
}
