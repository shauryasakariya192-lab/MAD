double calculateSimpleInterest(
  double principal,
  double rate,
  double time,
) {
  return (principal * rate * time) / 100;
}

void main() {
  print("Set 1: ${calculateSimpleInterest(10000, 5, 2)}");
  print("Set 2: ${calculateSimpleInterest(5000, 7, 3)}");
  print("Set 3: ${calculateSimpleInterest(15000, 6, 4)}");
}
