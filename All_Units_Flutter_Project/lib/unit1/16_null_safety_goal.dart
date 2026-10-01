void main() {
  String? careerGoal;

  print("Before assignment: ${careerGoal ?? "Not decided yet"}");

  careerGoal ??= "Flutter Developer";

  print("Career goal: $careerGoal");
}
