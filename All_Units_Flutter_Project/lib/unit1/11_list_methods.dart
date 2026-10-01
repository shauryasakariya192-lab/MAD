void main() {
  List<String> songs = [
    "Iron Man",
    "Avengers: Endgame",
    "Transformers",
    "Hi Papa",
    "Avengers: Infinity War",
  ];

  print("Original: $songs");

  songs.add("Tere Vaaste");
  print("After add: $songs");

  songs.remove("Tum Hi Ho");
  print("After remove: $songs");

  songs.sort();
  print("After sort: $songs");
}
