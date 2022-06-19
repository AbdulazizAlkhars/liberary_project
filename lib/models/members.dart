class Member {
  int id;
  String firstName;
  String lastName;
  List<int> currentlyBorrowedBooks;
  String membership;
  Member(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.currentlyBorrowedBooks,
      required this.membership});
}
