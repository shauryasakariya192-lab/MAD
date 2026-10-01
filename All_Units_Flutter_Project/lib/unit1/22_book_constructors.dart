class Book {
  String title;
  String author;

  Book(this.title, this.author);

  Book.defaultBook()
      : title = "The Alchemist",
        author = "Paulo Coelho";

  Book.named({required this.title, required this.author});

  void display() {
    print("Title: $title");
    print("Author: $author");
  }
}

void main() {
  Book book1 = Book.defaultBook();
  Book book2 = Book.named(
    title: "Jaun Elia Poetry",
    author: "Jaun Elia",
  );

  book1.display();
  print("");
  book2.display();
}
