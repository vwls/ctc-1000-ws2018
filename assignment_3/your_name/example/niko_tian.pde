class Particle {
  PVector pos = new PVector(random(width - 2), random(height - 2)); 
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector prevPos = pos.copy(); 
  float maxSpeed = 0.7;
  float m = random (0, 50);
  float n = random (0, 200);
  float k = random (0, 300);
  //float lifespan;


  void update() {
    prevPos.x = pos.x; 
    prevPos.y = pos.y; 

    vel.add(acc); 
    vel.limit(maxSpeed); 
    pos.add(vel); 
    //lifespan=255.0;

    if (pos.x >= width) pos.x = prevPos.x = 0;
    if (pos.x < 0) pos.x = prevPos.x = width - 1;
    if (pos.y >= height) pos.y = prevPos.y = 0;
    if (pos.y < 0) pos.y = prevPos.y = height - 1;

    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void display() {
    stroke(k, m, n);
    strokeWeight(0.6);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
  }

  void follow(PVector[] flowField) {

    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = x + y * cols;
    PVector force = flowField[index];
    applyForce(force);
  }
}

float inc = 0.2;
float scl = 10;
float zoff = 0;
int cols, rows;

Particle[] particles;
PVector[] flowField;

void setup()
{
  size(2880, 1800, P2D);
  background(0);
  cols = floor(width / scl);
  rows = floor(height / scl);

  particles = new Particle[1000];
  for (int i = 0; i < particles.length; ++i)
    particles[i] = new Particle();

  flowField = new PVector[cols * rows];
}

void draw()
{
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {

      int index = x + y * cols; 
      float angle = noise(xoff, yoff, zoff) * TWO_PI *1;
      PVector v = PVector.fromAngle(angle);
      v.setMag(1);
      flowField[index] = v;
      xoff += inc;
    }
    yoff += inc;
    zoff += 0.0003;
  }


  for (int i = 0; i < particles.length; ++i) {
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].display();
  }
}