//CONCEPT: user 'controls' the time, on an analog clock. Work completed on the first day.

int x=10;

int radius, cx, cy;

// RUNS ONCE
void setup () {
  size(800, 600);
  radius = min(width, height) / 2;
  cx = width / 2;
  cy = height / 2;
textSize(32);

}

// RUNS FOREVER
void draw() {
  background(255, 0, 0);
  //line(x, y, x2, y2);
  //line(10, 10, 200, 200);
  //println(mouseX, mouseY);
  strokeWeight(80);
  line(width/2, height/2, mouseX, mouseY);
  // Draw the minute ticks
  strokeWeight(20);
  beginShape(POINTS);
  for (int a = -60; a < 300; a+=30) {
    float angle = radians(a);
    float x = cx + cos(angle) * (.9 * radius);
    float y = cy + sin(angle) * (.9 * radius);
    vertex(x, y);
      text(a / 30 + 3, x + 5, y + 5);
  }
  endShape();
}