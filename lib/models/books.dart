class Books {
  int id;
  String author;
  String title;
  List<String> genre;
  bool available;
  List<int> borrowedBy;

  Books(
      {required this.id,
      required this.author,
      required this.title,
      required this.genre,
      this.available = true,
      this.borrowedBy = const []});
}
