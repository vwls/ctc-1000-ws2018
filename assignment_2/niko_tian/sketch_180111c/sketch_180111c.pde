ArrayList<boxclass> b;
int x = 0;
int y = 0;
float yoff = 220.200; 
//PFont font;

//float r;

// Angle and angular velocity, accleration
//float theta;
//float theta_vel;
//float theta_acc;

void setup() 
{
  size(400, 400, P3D);

  //font=loadFont("JCHEadA-150.vlw");
  noStroke();
  // r = height * 0.45;
  // theta = 0;
  //theta_vel = 10;
  //theta_acc = 0.0001;

  b = new ArrayList<boxclass>();
}

void draw() { 

  background(0); 
  //translate(width/2, height/2);



  ellipse (width/2, height/2, 200, 200);


  beginShape();
  fill(9);
  curveVertex(0, 400);
  curveVertex(100, 390);
  curveVertex(160, 250);
  curveVertex(180, 200);
  curveVertex(200, 210);
  curveVertex(220, 200);
  curveVertex(240, 250);
  curveVertex(300, 390);
  curveVertex(400, 400);
  endShape();

  beginShape();
  fill(0);
  curveVertex(0, 400);
  curveVertex(100, 390);
  curveVertex(160, 250);
  curveVertex(180, 200);
  curveVertex(200, 210);
  curveVertex(220, 200);
  curveVertex(240, 250);
  curveVertex(300, 390);
  curveVertex(400, 400);
  endShape();

  //fill(0);
  //textFont(font, 30);

  //text ("V O L C A N O", 135, 100);

  b.add(new boxclass(200, 185));
  //b.add (new boxclass(mouseX, mouseY));
  //b.add (new boxclass(x, y));
  //float x = r * cos(theta);p
  //float y = r * sin(theta);
  ellipseMode(CENTER);
  ellipse(x, y, 10, 10);

  //theta_vel += theta_acc;
  //theta += theta_vel;


  for (boxclass box : b) {
    box.display();
    box.update();
  }

  //save("112ctc_assignment2.tif"); 
   //saveFrame();
} 

class boxclass { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rx;
  float ry;
  float h = random (0, 300);
  float j = random (0, 150);
  float rb;

  //float p = random (0, 300);

  boxclass (float x, float y) {  
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, .05);
    rx = random(1, 200);
    ry = random(1, 200);
    rb = random(5, 15);
  } 
  void update() { 
    location.add(velocity);
    velocity.add(acceleration);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotateX(rx);
    rotateY(ry);
    fill(255, h, j );
    box(rb, rb, rb);
    fill(j, 0, 200);
    rect(width/2, height/2, 6, 10);
    popMatrix();
  }
} 