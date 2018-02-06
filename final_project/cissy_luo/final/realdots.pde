float t;
float u = map(random(30), 0, 30, 0, 100);
void setup() {
  frameRate(30);
  size(1000, 1000);
  t = -300;
  background(255, 225, 235);
  translate(width/2, height/2);
  noStroke();

  for (int arm = 0; arm < 20; arm++) {



    float x= u;
    x = -(x+(random(90)));

    for (float a = 1; a < 30; a++) {

      float y = a*8;

      float d = dist(x, y, 0, 0);

      pushMatrix();

      translate(-x, -y);
      rotate(radians(d-t)*2);
      float r = map(a, 0, 25, 0, 30); 

      fill(map(arm, 0, 20, random(100), random(200)), 0, map(arm, 0, 12, random(100), random(255)), 100);
      ellipse(x, y, r, r);
      popMatrix();
    }
    rotate(PI/6);
  }



  for (int arm = 0; arm < 20; arm++) {



    float x= u;
    x = x+(random(90));

    for (float a = 1; a < 30; a++) {

      float y = a*8;

      float d = dist(x, y, 0, 0);

      pushMatrix();

      translate(x, y);
      rotate(radians(d+t)*2);
      float r = map(a, 0, 25, 0, 30); 

      fill(0, map(arm, 0, 20, random(50), random(255)), map(arm, 0, 12, random(100), random(155)), 50);
      ellipse(x, y, r, r);
      popMatrix();
    }
    rotate(-PI/6);
  }


  for (int arm = 0; arm < 6; arm++) {
    float x = u;
    x = x+random(4, 10);

    for (float a = 1; a < 25; a++) {
      float y = a*8;

      float d = dist(x, y, 0, 0);

      pushMatrix();
      translate(x, y);
      rotate(radians((d-t)*2));
      float r = map(a, 0, 25, 0, 40); 
      fill(0, map(arm, 0, 12, 50, 100), map(arm, 0, 12, 100, 200));
      ellipse(-x, -y, r, r);
      popMatrix();
    }
    rotate(1.5*PI/8);
  }

  for (int arm = 0; arm < 6; arm++) {
    float x= u;
    x = -(x+random(4, 10));

    for (float a = 1; a < 25; a++) {

      float y = a*8;

      float d = dist(x, y, 500, 500);

      pushMatrix();

      translate(-x, -y);
      rotate(radians(d-t)*2);
      float r = map(a, 0, 25, 0, 40); 
      fill(map(arm, 0, 12, 100, 255), 0, map(arm, 0, 12, 50, 100));
      ellipse(x, y, r, r);
      popMatrix();
    }
    rotate(-1.5*PI/8);
  }

  t++;

 saveFrame("output.png");
 exit();
}