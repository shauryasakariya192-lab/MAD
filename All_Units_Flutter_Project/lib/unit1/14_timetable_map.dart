void main() {
  Map<String, String> timetable = {
    "Monday": "Dart",
    "Tuesday": "Flutter",
    "Wednesday": "Database",
    "Thursday": "Web Technology",
    "Friday": "Computer Networks",
  };

  timetable.forEach((day, subject) {
    print("$day: $subject");
  });
}
