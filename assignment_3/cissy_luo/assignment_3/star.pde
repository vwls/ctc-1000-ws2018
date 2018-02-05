class Star {
  float x;
  float y;
  float z;
  float pz;
  float lifespan = 255;

  Star() {
    x = map(random( -width, width), -1000, 1000, -mouseX+5, mouseX+5);
    y = map(random( -height, height), -1000, 1000, -mouseX+5, mouseX+5);
    z = mouseY;
    pz = z;
  }

  void show() {

    fill(50, lifespan, 100);

    stroke(50, lifespan, 100);
    float sx = map(x/z, 0, 1, 0, 100);
    float sy = map(y/z, 0, 1, 0, 100);
    float r = map(z, -width, width, 0, 20); 
    ellipse(sx, sy, r, r);
    float px = map(x/pz, 0, 1, 0, width/2);
    float py = map(y/pz, 0, 1, 0, height/2);
    stroke(random(0, 255), random(0, 255), random(0, 255), 50);
    line(px, py, sx, sy);
    pulse.freq(map(x, -width/2, width/2, 300, 500));
    tri.freq(map(lifespan, 0, 255, 700, 500));
  }
  void update() {
    lifespan = lifespan - 5;
    z = z - 10;
    if (z < 1) {
      z = random(width);
      x = random(-mouseX, mouseX);
      y = random(-mouseY, mouseY);
      pz = z;
    }
  }

  boolean isDead() {

    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}