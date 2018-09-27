PImage photo;

void setup() {
  size(800, 600);
  photo = loadImage("IMG_1804.jpg");
  photo.resize(800,600);
  background(photo);
  noStroke();
}

void draw() {
  for (int i = 0; i < 200; i = i+1) {
    for (int j = 0; j < 150; j = j+1) {
      color c = photo.get(4*i, 4*j);
      fill(c);
      rect(4*i, 4*j, 5, 5);
      //delay(1);
    }
  }
}
