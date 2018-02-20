class Line {
  PVector location;
  PVector location2;
  PVector velocity;
  PVector velocity2;
  PVector acceleration;
  PVector acceleration2;
  int topSpeed; 
  
  float locx;
  float locy;
  
  Line() { 
    location = new PVector(random(width), random(height)); 
    location2 = new PVector(location.x + 25, location.y + 25);
    velocity = new PVector(0, 0);
    velocity2 = new PVector(0, 0);
    topSpeed = 10;
  } 

  void update() {
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    acceleration2 = new PVector(random(-1, 1), random(-1, 1));
    acceleration.normalize();
    acceleration2.normalize();
    acceleration.mult(.05);
    acceleration2.mult(.05);
    location.add(velocity);
    location2.add(velocity2);
    velocity.add(acceleration);
    velocity2.add(acceleration2);
    velocity.limit(topSpeed);
  }

  void display() {
    float x = 0;
    stroke(255*sin(x+50),10);
    line(location.x, location.y, location2.x, location2.y);
    x = x + .01;
    
  }
}