void main() {
  int rollNumber = 15;
  int lastDigit = rollNumber % 10;

  for (int i = 1; i <= 10; i++) {
    print("$lastDigit x $i = ${lastDigit * i}");
  }
}
