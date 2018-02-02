//smoot
import peasy.PeasyCam;
PeasyCam cam;
float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 29;
float c = 8.0/4.0;

ArrayList<PVector> points = new ArrayList<PVector>();


void setup() {
  size(1000, 1000, P3D);
  colorMode (HSB, 200);
  cam = new PeasyCam(this, 500);
}

void draw () {
  
  background (0);
  float dt= 0.005;
  float dx = (a * ( y - x )) * dt;
  float dy = ( x* ( b - z ) - y) * dt;
  float dz =( x * y - c * z) * dt;
  float rx;
  float ry;
  float rz;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  //rx = random(1, 200);
  //  ry = random(1, 200);
  //  rz = random(1, 200);
 

  points.add(new PVector(x, y, z));
  translate (0, 0, -30);
  //(width/2, height/2);
  scale (5);
  stroke (255);
  strokeWeight(0.5);
  noFill();
  //rotateX(rx);
  //rotateY(ry);
  //rotateZ(rz);
  
  float hu=0;
  beginShape();
  for (PVector v : points) {
    stroke (hu, 255, 255);
    point (v.x, v.y, v.z);

    PVector offset = PVector.random3D();
    offset.mult (0);
    v.add(offset);

    hu+=0.1;
    if (hu>255) {
      hu=0;
    }
  }
  endShape();
  //point (x, y);
}