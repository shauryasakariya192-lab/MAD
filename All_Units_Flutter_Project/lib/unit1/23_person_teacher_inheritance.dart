class Person {
  String name;

  Person(this.name);

  void introduce() {
    print("My name is $name.");
  }
}

class Teacher extends Person {
  String subject;

  Teacher(super.name, this.subject);

  @override
  void introduce() {
    print("My name is $name and my favourite teacher's subject is $subject.");
  }
}

void main() {
  Teacher teacher = Teacher("ansh", "Computer");
  teacher.introduce();
}
