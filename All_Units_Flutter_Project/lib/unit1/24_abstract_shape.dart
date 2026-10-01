abstract class Shape {
  double area();
  double perimeter();
}

class Triangle extends Shape {
  double base;
  double height;
  double side1;
  double side2;
  double side3;

  Triangle(
    this.base,
    this.height,
    this.side1,
    this.side2,
    this.side3,
  );

  @override
  double area() => 0.5 * base * height;

  @override
  double perimeter() => side1 + side2 + side3;
}

class Square extends Shape {
  double side;

  Square(this.side);

  @override
  double area() => side * side;

  @override
  double perimeter() => 4 * side;
}

void main() {
  Shape triangle = Triangle(10, 6, 7, 8, 9);
  Shape square = Square(5);

  print("Triangle area: ${triangle.area()}");
  print("Triangle perimeter: ${triangle.perimeter()}");
  print("Square area: ${square.area()}");
  print("Square perimeter: ${square.perimeter()}");
}
