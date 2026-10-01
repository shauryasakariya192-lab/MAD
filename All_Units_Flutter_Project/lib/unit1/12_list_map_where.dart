void main() {
  List<int> marks = [78, 65, 82, 91, 74, 88];

  print("Original marks: $marks");

  List<int> graceMarks = marks.map((mark) => mark + 5).toList();
  print("After adding 5 grace marks: $graceMarks");

  List<int> filteredMarks = marks.where((mark) => mark >= 50).toList();
  print("Marks 50 or above: $filteredMarks");
}
