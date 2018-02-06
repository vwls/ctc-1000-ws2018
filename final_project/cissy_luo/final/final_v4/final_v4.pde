float t;
float u = map(noise(5), 0, 1, 0, 300);
void setup() {
  size(1000, 1000);
  t = -300;
} 

void draw() {
  background(100);
  translate(width/2, height/2);
  noStroke();
  fill(255);
  for (int theta = 0; theta < 6; theta++) {
    float x = u;
    x = x+5;

    for (float a = 1; a < 25; a++) {
      float y = a*8;

      float d = dist(x, y, 0, 0);

      pushMatrix();
      translate(x, y);
      rotate(radians(d-t)*2);
      float r = map(a, 0, 25, 0, 40); 
      ellipse(-x, -y, r, r);
      popMatrix();
    }
    rotate(1.5*PI/8);
  }
  fill(0);
  for (int theta = 0; theta < 6; theta++) {
    float x= u;
    x = -(x+5);

    for (float a = 1; a < 25; a++) {
      float y = a*8;

      float d = dist(x, y, 500, 500);

      pushMatrix();

      translate(-x, -y);
      rotate(radians(d-t)*2);
      float r = map(a, 0, 25, 0, 40); 
      ellipse(x, y, r, r);
      popMatrix();
    }
    rotate(-1.5*PI/8);
  }

  t++;

  saveFrame("output############.png");
}