abstract class Drawable {
  void draw();
}

abstract class Resizable {
  void resize();
}

class Photo implements Drawable, Resizable {
  String fileName;

  Photo(this.fileName);

  @override
  void draw() {
    print("Drawing photo: $fileName");
  }

  @override
  void resize() {
    print("Resizing photo: $fileName");
  }

  void displayDetails() {
    print("Photo file: $fileName");
  }
}

void main() {
  Photo photo = Photo("my_photo.jpg");

  photo.displayDetails();
  photo.draw();
  photo.resize();
}
