float t;
void setup() {
  size(1000, 1000);
  t = -120;
}

void draw() {
  background(100);
  translate(width/2, height/2);
  noStroke();
  fill(255);
  for (int arm = 0; arm < 6; arm ++) {
    float x=0;
    x = x+5;

    for (float a = 1; a < 15; a++) {
      float y = a*8;

      float d = dist(x, y, 0, 0);

      pushMatrix();
      translate(x, y);
      float r = map(a, 0, 15, 1, 16); 
      rotate(radians(d+t) * (a+15)/24);
      ellipse(x, y, r, r);

      popMatrix();
    }
    rotate(PI/6);
  }
  fill(0);
  for (int arm = 0; arm < 6; arm ++) {
    float x=0;
    x = -(x+5);

    for (float a = 1; a < 15; a++) {
      float y = a*8;

      float d = dist(x, y, 0, 0);

      pushMatrix();
      translate(-x, -y);
      float r = map(a, 0, 15, 1, 16); 
      rotate(radians(d-t) * (a+15)/24);
      ellipse(-x, y, r, r);

      popMatrix();
    }
    rotate(-PI/6);
  }

  t++;
  saveFrame("output################.png");
}