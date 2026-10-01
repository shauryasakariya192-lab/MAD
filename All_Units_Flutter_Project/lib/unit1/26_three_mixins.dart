mixin Coding {
  void coding() {
    print("I can code.");
  }
}

mixin Drawing {
  void drawing() {
    print("I can draw.");
  }
}

mixin Communication {
  void communication() {
    print("I can communicate.");
  }
}

class MySkills with Coding, Drawing, Communication {}

void main() {
  MySkills skills = MySkills();

  skills.coding();
  skills.drawing();
  skills.communication();
}
