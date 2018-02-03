/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * body parts functions  * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// createBeak
void createBeak() {
  createRGB("beak");
  translate(5, 30);
  beakShape = createShape();
  beakShape.beginShape();
  beakShape.vertex(345, 124);
  beakShape.vertex(391, 147.5);
  beakShape.vertex(345, 147.5);
  beakShape.endShape(CLOSE);
  shape(beakShape, 0, 0);
  resetMatrix();
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// createHair
void createHair() {
  createRGB("hairTail");
  translate(6, 30);
  hairShape = createShape();
  hairShape.beginShape();
  boolean whichHair = (random(0, 100) >= 50);

  // hair-do number 1
  if (whichHair) {
    hairShape.vertex(279.5, 91);
    hairShape.vertex(232.5, 164);
    hairShape.vertex(279.5, 186.5);
  } else { 
    // hair-do number 2
    hairShape.vertex(236, 91);
    hairShape.vertex(279.5, 91);
    hairShape.vertex(279.5, 200);
  }
  hairShape.endShape(CLOSE);
  shape(hairShape, 0, 0);
  resetMatrix();
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// createBody
void createBody() {
  createRGB("body");
  translate(width/2, height/2);
  pushMatrix();
  rotate(radians(-25));
  arc(0, 0, 200, 200, 0, radians(180), CHORD);
  popMatrix();
  resetMatrix();
}

void createBodyShadow() {
  createRGB("hairTail");
  translate(240, 255);
  pushMatrix();
  rotate(radians(-25));
  arc(0, 0, 200, 200, 0, radians(180), CHORD);
  popMatrix();
  resetMatrix();
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// createHead
void createHead() {
  createRGB("body");
  translate(5, 30);
  headShape = createShape();
  headShape.beginShape();
  headShape.vertex(280, 91);
  headShape.vertex(345, 123);
  headShape.vertex(345, 222.5);
  headShape.vertex(280, 205);
  headShape.endShape(CLOSE);
  shape(headShape, 0, 0);
  resetMatrix();
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// createEye
void createEye() {
  fill(255);
  translate(320, 170);
  ellipse(0, 0, 15.5, 15.5);
  resetMatrix();
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// createWing
void createWing() {
  boolean whichWing = (random(0, 100) >= 50);
  
  // shadow
  createRGB("hairTail");
  pushMatrix();
  if (whichWing) {
    translate(225, 245);
    rotate(radians(-30));
  } else {
    translate(218, 235);
  }
  arc(0, 0, 125, 125, 0, radians(180), CHORD);
  popMatrix();
  resetMatrix();
  
  // actual wing
  createRGB("wing");
  pushMatrix();
  if (whichWing) {
    translate(230, 240);
    rotate(radians(-30));
  } else {
    translate(223, 230);
  }
  arc(0, 0, 125, 125, 0, radians(180), CHORD);
  popMatrix();
  resetMatrix();
}