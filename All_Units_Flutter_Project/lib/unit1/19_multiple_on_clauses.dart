void main() {
  const name = "ansh";
  const foods = ["Veg Hakka Noodles", "Veg Manchurian", "Veg Fried Rice"];

  try {
    int number = int.parse(name);
    print(number);
  } on FormatException {
    print("Format error: '$name' cannot be converted to an integer.");
  }

  try {
    print(foods[5]);
  } on RangeError {
    print("Range error: The requested food index does not exist.");
  }
}
