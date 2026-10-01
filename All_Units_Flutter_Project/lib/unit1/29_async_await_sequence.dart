import 'dart:async';

Future<String> fetchName() async {
  await Future.delayed(const Duration(seconds: 1));
  return "Jadav Tushar";
}

Future<int> fetchRollNumber() async {
  await Future.delayed(const Duration(seconds: 1));
  return 15;
}

Future<String> fetchResult() async {
  await Future.delayed(const Duration(seconds: 1));
  return "Passed";
}

Future<void> main() async {
  String name = await fetchName();
  print("Name: $name");

  int rollNumber = await fetchRollNumber();
  print("Roll Number: $rollNumber");

  String result = await fetchResult();
  print("Final Result: $result");
}
