import 'dart:async';

Future<String> fetchCollegeName() async {
  await Future.delayed(const Duration(seconds: 2));
  return "Atmiya University";
}

void main() {
  print("Fetching college name...");

  fetchCollegeName().then((collegeName) {
    print("College: $collegeName");
  });

  print("This message prints immediately before the delay completes.");
}
