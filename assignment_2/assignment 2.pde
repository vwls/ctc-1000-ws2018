 float xa = 0;
float ya = 400;
float xb = 400;
float yb = 0;
float xc = 400;
float yc = 0;
float xd = 400;
float yd = 400;



int axdirection = 1;
int aydirection = 1;
int bxdirection = 1;
int bydirection = 1;
int cxdirection = 1;
int cydirection = 1;
int dxdirection = 1;
int dydirection = 1;

PImage img;
int count = 0; 


void setup() {
  size(800, 800);
  stroke(248, 247, 245);
  strokeWeight(1.5);
}

void draw() {
  background(248, 247, 245);




  fill(0, 162, 173);  

  xa = xa + (1.3 * axdirection);
  ya = ya + (1 * aydirection);

  if (xa > width/2 || xa < 0 ) {
    axdirection *= -1;
  }
  if (ya > height || ya <height/2 ) {
    aydirection *= -1;
  }

  xb = xb + (1.4 * bxdirection);
  yb = yb + (0.9 * bydirection );

  if (xb > width/2 || xb < 0) {
    bxdirection *= -1;
  }

  if ( yb > height/2 || yb < 0 ) {
    bydirection *= -1;
  }


  xc = xc + (0.9 * cxdirection);
  yc = yc + (1.2 * cydirection);

  if (xc < 400 || xc > 800 ) {
    cxdirection *= -1;
  }
  if (yc > height/2 || yc < 0) {
    cydirection *= -1;
  }

  xd = xd + (0.7 * dxdirection);
  yd = yd + (1.1 * dydirection);

  if (xd < width/2 || xd > width ) {
    dxdirection *= -1;
  }
  if (yd < height/2 || yd > height) {
    dydirection *= -1;
  }

  fill(0, 162, 173);
  triangle(0, 0, xa, ya, xb, yb);
  triangle( xc, yc, xb, yb, 800, 0);
  triangle(0, 800, xa, ya, xd, yd);
  triangle(800, 800, xd, yd, xc, yc);


  if (xb < 300 && yb < 300 && xc > 500 && yc < 300 || xa < 300 && ya > 500 && xd > 500 && yd > 500) {
    fill(254, 214, 93); 
    quad(xa, ya, xb, yb, xc, yc, xd, yd);




    if (count >0 && count < 2 ) {
      img = loadImage("snoopy.jpg");
      image(img, xb, yb, ya/2, ya/2);
    }
    if (count >1 && count <3) {
      img = loadImage("snoopy2.jpg");
      image(img, xb, yb, ya/2, ya/2);
    }
    if (count >2 && count <4) {
      img = loadImage("snoopy3.jpg");
      image(img, xb, yb, ya/2, ya/2);
    }
    reset();
  }
}


void mouseClicked() {
  count = count +1;
}

void reset() {
  if (count > 3) {
    count = 0;
  }
}