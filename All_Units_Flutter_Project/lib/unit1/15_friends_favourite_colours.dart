void main() {
  Map<String, String> favouriteColours = {
    "ABC": "Blue",
    "XYZ": "Black",
    "PQR": "Red",
    "LMN": "Green",
    "DEF": "White",
  };

  favouriteColours.putIfAbsent("Jadav Tushar", () => "Red");

  favouriteColours.forEach((name, colour) {
    print("$name: $colour");
  });
}
