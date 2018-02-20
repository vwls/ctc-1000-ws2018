/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * assignment2_generativeLogo  * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * jhebert * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * ctc-1000-03 * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * jan12 * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

import java.util.Map;

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * variables * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

// HashMap of colors
HashMap<String, int[]> colorMap = new HashMap<String, int[]>();

// beak shape
PShape beakShape;
// head shape;
PShape headShape;
// hair shape;
PShape hairShape;

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * setup function  * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void setup() {

  // set up background, scene, and frame rate
  size(500, 500);
  smooth();
  background(255);
  noStroke();
  frameRate(1);

  // decide color
  float ranNum = random(0, 100);
  setColor(chooseColor(ranNum));

  // create beak
  createBeak();

  // create hair
  createHair();

  // create body shadow
  createBodyShadow();

  // create body
  createBody();

  // create head
  createHead();
  
  // create wing
  createWing();

  // create eye
  createEye();
}

// runs setup repeatedly
void draw() {
  setup();
}