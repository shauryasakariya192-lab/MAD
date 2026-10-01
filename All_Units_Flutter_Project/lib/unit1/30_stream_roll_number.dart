import 'dart:async';

Stream<int> rollNumberStream(int rollNumber) async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield rollNumber * i;
  }
}

Future<void> main() async {
  const rollNumber = 15;

  await for (int value in rollNumberStream(rollNumber)) {
    print("Roll number × multiplier: $value");
  }
}
