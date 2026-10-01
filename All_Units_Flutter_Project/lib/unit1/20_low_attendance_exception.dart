class LowAttendanceException implements Exception {
  final String studentName;
  final double attendance;

  LowAttendanceException(this.studentName, this.attendance);

  @override
  String toString() =>
      "$studentName has low attendance: $attendance%";
}

void checkAttendance(String name, double attendance) {
  if (attendance < 75) {
    throw LowAttendanceException(name, attendance);
  }

  print("$name has sufficient attendance: $attendance%");
}

void main() {
  try {
    checkAttendance("Jadav Tushar", 100);
  } catch (e) {
    print(e);
  }
}
