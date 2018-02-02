float y = 0.01;
float x = 0.01;
float z = 0.01;
PFont Font1;

void setup() {
  size(1500, 1500, P3D);
  background(255);
  Font1 = createFont("Arial Bold", 43);
}

void draw() {
  stroke(255);
  fill(0);
  textSize(80);
  textFont(Font1);
  //text("AUSTEN", 830, 910);
  //x += random(.01);
  //y += random(0.01, .02);
  //z += random(0.01, .02);
  x += 0.01;
  y += 0.01;
  z += 0.01; 

  float randomNum = random(80, 255);
  float randomNum2 = random(80, 255);
  float randomNum3 = random(80, 255);
  float randomNum4 = random(80, 255);
  float randomNum5 = random(80, 255);
  float randomNum6 = random(80, 255);
  float randomNum7 = random(80, 255);
  float randomNum8 = random(80, 255);
  float randomNum9 = random(80, 255);
  float randomNum10 = random(80, 255);
  float randomNum11 = random(80, 255);
  float randomNum12 = random(80, 255);
  float randomNum13 = random(80, 255);
  float randomNum14 = random(80, 255);
  float randomNum15 = random(80, 255);
  float randomNum16 = random(80, 255);
  float randomNum17 = random(80, 255);
  float randomNum18 = random(80, 255);
  float randomNum19 = random(80, 255);
  float randomNum20 = random(80, 255);
  float randomNum21 = random(80, 255);
  float randomNum22 = random(80, 255);
  float randomNum23 = random(80, 255);
  float randomNum24 = random(80, 255);
  float randomNum25 = random(80, 255);
  float randomNum26 = random(80, 255);
  float randomNum27 = random(80, 255);

  // Center box
  pushMatrix();
  strokeWeight(10);
  fill(randomNum, randomNum2, randomNum3);
  translate(750, 750);
  rotateX(x);
  rotateY(y);
  //rotateZ(z);
  box(180);
  popMatrix();

  // Landscape boxes
  pushMatrix();
  strokeWeight(6);
  fill(randomNum4, randomNum5, randomNum6);
  translate(750, 550);
  //rotateX(x);
  rotateY(y);
  translate(200, 200);
  rotateZ(z);
  box(60);
  popMatrix();

  pushMatrix();
  strokeWeight(6);
  fill(randomNum22, randomNum23, randomNum24);
  translate(750, 550);
  //rotateX(x);
  rotateY(y);
  translate(-200, 200);
  rotateZ(z);
  box(60);
  popMatrix();

  pushMatrix();
  strokeWeight(6);
  fill(randomNum25, randomNum26, randomNum27);
  translate(750, 550);
  //rotateX(x);
  rotateY(y);
  translate(0, 200, 200);
  rotateZ(z);
  box(60);
  popMatrix();

  pushMatrix();
  strokeWeight(6);
  fill(randomNum7, randomNum8, randomNum9);
  translate(750, 550);
  //rotateX(x);
  rotateY(y);
  translate(0, 200, -200);
  rotateZ(z);
  box(60);
  popMatrix();

  // Horizontal boxes
  pushMatrix();
  strokeWeight(6);
  fill(randomNum10, randomNum11, randomNum12);
  translate(550, 750);
  rotateX(x);
  translate(200, 200);
  //rotateY(y);
  rotateZ(z);
  box(60);
  popMatrix();

  pushMatrix();
  strokeWeight(6);
  fill(randomNum13, randomNum14, randomNum15);
  translate(550, 750);
  rotateX(x);
  translate(200, -200);
  //rotateY(y);
  rotateZ(z);
  box(60);
  popMatrix();

  pushMatrix();
  strokeWeight(6);
  fill(randomNum16, randomNum17, randomNum18);
  translate(550, 750, 0);
  rotateX(x);
  translate(200, 0, -200);
  //rotateY(y);
  rotateZ(z);
  box(60);
  popMatrix();

  pushMatrix();
  strokeWeight(6);
  fill(randomNum19, randomNum20, randomNum21);
  translate(550, 750, 0);
  rotateX(x);
  translate(200, 0, 200);
  //rotateY(y);
  rotateZ(z);
  box(60);
  popMatrix();
}

void mouseClicked() {
  saveFrame();
}