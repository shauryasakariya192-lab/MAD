class Student {
  String name;
  int rollNumber;
  double mark1;
  double mark2;
  double mark3;

  Student(
    this.name,
    this.rollNumber,
    this.mark1,
    this.mark2,
    this.mark3,
  );

  void printResult() {
    double average = (mark1 + mark2 + mark3) / 3;
    String grade;

    if (average >= 90) {
      grade = "A+";
    } else if (average >= 80) {
      grade = "A";
    } else if (average >= 70) {
      grade = "B";
    } else if (average >= 60) {
      grade = "C";
    } else if (average >= 50) {
      grade = "D";
    } else {
      grade = "F";
    }

    print("Name: $name");
    print("Roll Number: $rollNumber");
    print("Average: ${average.toStringAsFixed(2)}");
    print("Grade: $grade");
  }
}

void main() {
  Student student = Student("Jadav Tushar", 15, 82, 76, 89);
  student.printResult();
}
