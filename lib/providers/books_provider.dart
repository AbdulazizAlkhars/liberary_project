import 'package:flutter/foundation.dart';
import 'package:liberary_project/models/books.dart';

class BooksProvider extends ChangeNotifier {
  
  List<Books> books = [...Books.list];
  void searchBook(String query) {
    List<Books> filteredList = [...books]
        .where((element) =>
            element.title.toLowerCase().contains(query) ||
            element.genre
                .any((element) => element.toLowerCase().contains(query)))
        .toList();

    books = filteredList;
    notifyListeners();
  }

  void addBook({required title, required author, required genre}) {
    List<String> listGenre = [genre];
    var item = Books(
        id: books[books.length - 1].id + 1,
        author: author,
        title: title,
        genre: listGenre);

    books.add(item);
    notifyListeners();
  }

  void borrowBook({required int id}) {
    var item = books.firstWhere((element) => element.id == id);
    item.available = !item.available;
    notifyListeners();
  }

  List getBooksTitle(List currentlyBorrowed) {
    List<String> names = [];
    for (Books book in books) {
      if (currentlyBorrowed.any((element) => element == book.id)) {
        names.add(book.title);
      }
    }
    return names;
  }
}
