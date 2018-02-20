int xa = 0;
int ya = 500;
int xb = 500;
int yb = 0;
int xc = 600;
int yc = 0;
int xd = 500;
int yd = 600;
int xe = 600;
int ye = 600;
int xf = 0;
int yf = 0;

boolean isTriangle = false;
boolean isCircle = true;
boolean isnotRed = true;
boolean isRed = false;

int axdirection = 1;
int aydirection = 1;
int bxdirection = 1;
int bydirection = 1;
int cxdirection = 1;
int cydirection = 1;
int dxdirection = 1;
int dydirection = 1;
int exdirection = 1;
int eydirection = 1;
int fxdirection = 1;
int fydirection = 1;


PImage img;
float noff = 0.0;
float moff = 0.0;
float ooff = 0.0;




void setup() {

  size(1000, 1000);
  img = loadImage("1.jpg");
  image(img, 0, 0);
  noStroke();
}




void draw() { 

  xa = xa + (1 * axdirection);
  ya = ya + (2 * aydirection);

  if (xa > 500 || xa < 0 ) {
    axdirection *= -1;
  }
  if (ya > height || ya <height/2 ) {
    aydirection *= -1;
  }

  xb = xb + (3 * bxdirection);
  yb = yb + (1 * bydirection );

  if (xb > width/2 || xb < 0) {
    bxdirection *= -1;
  }

  if ( yb > height/2 || yb < 0 ) {
    bydirection *= -1;
  }


  xc = xc + (2 * cxdirection);
  yc = yc + (3 * cydirection);

  if (xc < width/2 || xc > height ) {
    cxdirection *= -1;
  }
  if (yc > height/2 || yc < 0) {
    cydirection *= -1;
  }

  xd = xd + (3 * dxdirection);
  yd = yd + (1 * dydirection);

  if (xd < width/2 || xd > width ) {
    dxdirection *= -1;
  }
  if (yd < height/2 || yd > height) {
    dydirection *= -1;
  }

  xe = xe + (4 * exdirection);
  ye = ye + (3 * eydirection);

  if (xe < 0 || xe > width ) {
    exdirection *= -1;
  }
  if (ye < 0 || ye > height) {
    eydirection *= -1;
  }

  xf = xf + (3 * fxdirection);
  yf = yf + (2 * fydirection);

  if (xf< 0 || xf > width*3/4) {
    fxdirection *= -1;
  }
  if (yf < 0 || yf > height*3/5) {
    fydirection *= -1;
  }



  noff = noff + 0.01;
  float n = noise(noff)*width*2/5;

  moff = moff + 0.04;
  float m = noise(moff)*width*1/2;

  ooff = ooff + 0.07;
  float o = noise(ooff)*width*3/7;

  if (key == '1') {

    img = loadImage("1.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '2') {
    img = loadImage("2.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '3') {
    img = loadImage("3.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '4') {
    img = loadImage("4.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '5') {
    img = loadImage("5.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '6') {
    img = loadImage("6.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '7') {
    img = loadImage("7.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '8') {
    img = loadImage("8.jpg");
    image(img, 0, 0);
    noStroke();
  }

  if (keyPressed && key == '9') {
    img = loadImage("9.jpg");
    image(img, 0, 0);
    noStroke();
  }


  if (key == 'c') {
    isCircle = true;
    isTriangle = false;
  } else if (keyPressed && key == 't') {
    isCircle = false;
    isTriangle= true;
  }

  if (isCircle) {
    fill(img.get(xa, ya), 10);
    ellipse(xa, ya, o, o);

    fill(img.get(xb, yb), 10);
    ellipse(xb, yb, m, m);

    fill(img.get(xd, yd), 10);
    ellipse(xd, yd, n, n);

    fill(img.get(xc, yc), 10);
    ellipse(xc, yc, o, o);

    fill(img.get(xe, ye), 10);
    ellipse(xe, ye, m, m);

    fill(img.get(xf, yf), 10);
    ellipse(xf, yf, n, n);
  } else if (isTriangle) {


    fill(img.get(xa, ya), 7);
    triangle(xa, ya, xb, yb, xd, yd);

    fill(img.get(xc, yc), 7);
    triangle(xa, ya, xb, yb, xc, yc);


    fill(img.get(xb, yb), 7);
    triangle(xb, yb, xc, yc, xe, ye);

    fill(img.get(xd, yd), 7);
    triangle(xc, yc, xd, yd, xe, ye);

    fill(img.get(xf, yf), 7);
    triangle(xf, yf, xc, yc, xd, yd);

    fill(img.get(xe, ye), 7);
    triangle(xe, ye, xf, yf, xa, ya);
  }



  if (key == 'r') {
    isnotRed = false;
    isRed = true;
  } else if (key == 'g') {
    isnotRed = true;
    isRed = false;
  }

  if (isRed == true) {

    if (red(img.get(xa, ya))> 150 && green(img.get(xa, ya)) < 150 && blue(img.get(xa, ya)) < 150 ) {

      fill(img.get(xa, ya), 100);
      ellipse(xa, ya, o, o);
    } else { 

      fill(img.get(xa, ya), 0);
      ellipse(xa, ya, o, o);
      fill(img.get(xb, yb), 0);
      ellipse(xb, yb, m, m);
      fill(img.get(xc, yc), 0);
      ellipse(xc, yc, o, o);
      fill(img.get(xd, yd), 0);
      ellipse(xd, yd, o, o);
      fill(img.get(xe, ye), 0);
      ellipse(xe, ye, o, o);
      fill(img.get(xf, yf), 0);
      ellipse(xf, yf, o, o);
    }


    if (red(img.get(xb, yb)) > 150 && green(img.get(xb, yb)) < 150 && blue(img.get(xb, yb)) < 150 ) {


      fill(img.get(xb, yb), 100);
      ellipse(xb, yb, m, m);
    } else {
      fill(img.get(xa, ya), 0);
      ellipse(xa, ya, o, o);
      fill(img.get(xb, yb), 0);
      ellipse(xb, yb, m, m);
      fill(img.get(xc, yc), 0);
      ellipse(xc, yc, o, o);
      fill(img.get(xd, yd), 0);
      ellipse(xd, yd, o, o);
      fill(img.get(xe, ye), 0);
      ellipse(xe, ye, o, o);
      fill(img.get(xf, yf), 0);
      ellipse(xf, yf, o, o);
    }

    if (red(img. get(xc, yc)) > 150 && green(img.get(xc, yc)) < 150 && blue(img.get(xc, yc)) < 150) {

      fill(img.get(xc, yc), 100);
      ellipse(xc, yc, o, o);
    } else {
      fill(img.get(xa, ya), 0);
      ellipse(xa, ya, o, o);
      fill(img.get(xb, yb), 0);
      ellipse(xb, yb, m, m);
      fill(img.get(xc, yc), 0);
      ellipse(xc, yc, o, o);
      fill(img.get(xd, yd), 0);
      ellipse(xd, yd, o, o);
      fill(img.get(xe, ye), 0);
      ellipse(xe, ye, o, o);
      fill(img.get(xf, yf), 0);
      ellipse(xf, yf, o, o);
    }

    if (red(img. get(xd, yd)) > 150 && green(img.get(xd, yd)) < 150 && blue(img.get(xd, yd)) < 150) {

      fill(img.get(xd, yd), 100);
      ellipse(xd, yd, o, o);
    } else {
      fill(img.get(xa, ya), 0);
      ellipse(xa, ya, o, o);
      fill(img.get(xb, yb), 0);
      ellipse(xb, yb, m, m);
      fill(img.get(xc, yc), 0);
      ellipse(xc, yc, o, o);
      fill(img.get(xd, yd), 0);
      ellipse(xd, yd, o, o);
      fill(img.get(xe, ye), 0);
      ellipse(xe, ye, o, o);
      fill(img.get(xf, yf), 0);
      ellipse(xf, yf, o, o);
    }

    if (red(img. get(xe, ye)) > 150 && green(img.get(xe, ye)) < 150 && blue(img.get(xe, ye)) < 150) {

      fill(img.get(xe, ye), 100);
      ellipse(xe, ye, o, o);
    } else {
      fill(img.get(xa, ya), 0);
      ellipse(xa, ya, o, o);
      fill(img.get(xb, yb), 0);
      ellipse(xb, yb, m, m);
      fill(img.get(xc, yc), 0);
      ellipse(xc, yc, o, o);
      fill(img.get(xd, yd), 0);
      ellipse(xd, yd, o, o);
      fill(img.get(xe, ye), 0);
      ellipse(xe, ye, o, o);
      fill(img.get(xf, yf), 0);
      ellipse(xf, yf, o, o);
    }

    if (red(img. get(xf, yf)) > 150 && green(img.get(xf, yf)) < 150 && blue(img.get(xf, yf)) < 150) {

      fill(img.get(xf, yf), 100);
      ellipse(xf, yf, o, o);
    } else {

      fill(img.get(xa, ya), 0);
      ellipse(xa, ya, o, o);
      fill(img.get(xb, yb), 0);
      ellipse(xb, yb, m, m);
      fill(img.get(xc, yc), 0);
      ellipse(xc, yc, o, o);
      fill(img.get(xd, yd), 0);
      ellipse(xd, yd, o, o);
      fill(img.get(xe, ye), 0);
      ellipse(xe, ye, o, o);
      fill(img.get(xf, yf), 0);
      ellipse(xf, yf, o, o);
    }
   
    println(red(img.get(xa, ya)));
    println(red(img.get(xb, yb)));
    println(red(img.get(xc, yc)));
    println(red(img.get(xd, yd)));
    println(red(img.get(xe, ye)));
    println(red(img.get(xf, yf)));
  }
}

void keyPressed () {
  if (key == 's') {
    saveFrame("img-####" + ".jpg");
  }
}