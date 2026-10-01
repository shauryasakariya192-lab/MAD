void main() {
  Set<String> myHobbies = {"Gaming", "Travelling", "Listening to music"};
  Set<String> friendHobbies = {"Cricket", "Photography", "Travelling"};

  print("My hobbies: $myHobbies");
  print("Friend's hobbies: $friendHobbies");
  print("Union: ${myHobbies.union(friendHobbies)}");
  print("Intersection: ${myHobbies.intersection(friendHobbies)}");
  print("Difference: ${myHobbies.difference(friendHobbies)}");
}
