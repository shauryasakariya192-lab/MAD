void printMarks({
  required int dart,
  required int flutter,
  required int database,
  required int web,
}) {
  print("Dart: $dart");
  print("Flutter: $flutter");
  print("Database: $database");
  print("Web: $web");
}

void main() {
  printMarks(
    dart: 82,
    flutter: 78,
    database: 75,
    web: 80,
  );
}
