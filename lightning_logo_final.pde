void setup() {
  size(400, 600);
  background(0);
  noStroke(); 
  noCursor();
  frameRate(5);
}
void draw() {
  float color1 = random(255, 255);
  float color2 = random(150, 200);
  float color3 = random(100, 150);
  float lightRandR = random(245, 255);
  float lightRandG = random(255, 255);
  float lightRandB = random(125, 255);
  float medRandR = random(240, 255);
  float medRandG = random(255, 255);
  float medRandB = random(75, 200);
  float brightRandR = random(255, 255);
  float brightRandG = random(255, 255);
  float brightRandB = random(110, 180);
  // generate random red-orange rectangles
  fill(color1, color2, color3); rect(125, 100, 25, 25);
  fill(color1, color2, color3);rect(125, 125, 25, 25);
  fill(color1, color2, color3);rect(325, 100, 25, 25);
  fill(color1, color2, color3);rect(325, 125, 25, 25);
  fill(color1, color2, color3); rect(75, 425, 25, 50);
  fill(color1, color2, color3);rect(100, 375, 25, 25);
  fill(color1, color2, color3);rect(100, 400, 25, 25);  
  fill(color1, color2, color3);rect(125, 325, 25, 25);
  fill(color1, color2, color3);rect(125, 350, 25, 25);
  fill(color1, color2, color3);rect(50, 250, 25, 25);
  fill(color1, color2, color3);rect(50, 275, 25, 25);  
  fill(color1, color2, color3);rect(75, 200, 25, 25);
  fill(color1, color2, color3);rect(75, 225, 25, 25);
  fill(color1, color2, color3);rect(100, 150, 25, 25);
  fill(color1, color2, color3);rect(100, 175, 25, 25);
  fill(color1, color2, color3);rect(150, 100, 175, 25);
  fill(color1, color2, color3);rect(175, 100, 25, 25);
  fill(color1, color2, color3);rect(200, 100, 25, 25);
  fill(color1, color2, color3);rect(225, 100, 25, 25);
  fill(color1, color2, color3);rect(250, 100, 25, 25);
  fill(color1, color2, color3);rect(275, 100, 25, 25);
  fill(color1, color2, color3);rect(300, 100, 25, 25);
  fill(color1, color2, color3);rect(325, 100, 25, 25);
  fill(color1, color2, color3);rect(225, 225, 25, 25);
  fill(color1, color2, color3);rect(250, 225, 25, 25);
  fill(color1, color2, color3); rect(275, 225, 25, 25);
  fill(color1, color2, color3);rect(300, 225, 25, 25);
  fill(color1, color2, color3);rect(225, 225, 25, 25);
  fill(color1, color2, color3);rect(250, 225, 25, 25);
  fill(color1, color2, color3);rect(275, 225, 25, 25);
  fill(color1, color2, color3);rect(300, 225, 25, 25);
  fill(color1, color2, color3); rect(75, 275, 25, 25);
  fill(color1, color2, color3);rect(100, 275, 25, 25);
  fill(color1, color2, color3);rect(125, 275, 25, 25);
  fill(color1, color2, color3);rect(150, 275, 25, 25);
  fill(color1, color2, color3);rect(100, 450, 25, 25);
  fill(color1, color2, color3);rect(300, 250, 25, 25);
  fill(color1, color2, color3);rect(300, 150, 25, 25);
  fill(color1, color2, color3);rect(275, 175, 25, 25);
  fill(color1, color2, color3);rect(250, 200, 25, 25);
  fill(color1, color2, color3);rect(275, 275, 25, 25);
  fill(color1, color2, color3);rect(250, 300, 25, 25);
  fill(color1, color2, color3);rect(225, 325, 25, 25);
  fill(color1, color2, color3); rect(200, 350, 25, 25); 
  fill(color1, color2, color3);rect(175, 375, 25, 25);
  fill(color1, color2, color3);rect(150, 400, 25, 25);
  fill(color1, color2, color3);rect(125, 425, 25, 25);
  fill(color1, color2, color3);rect(150, 300, 25, 25);
 // generate light yellow rectangles 
  fill(lightRandR, lightRandG, lightRandB);rect(150, 125, 150, 25);
  fill(lightRandR, lightRandG, lightRandB);rect(125, 150, 25, 50);
  fill(lightRandR, lightRandG, lightRandB);rect(100, 200, 25, 50);
  fill(lightRandR, lightRandG, lightRandB);rect(200, 250, 75, 25);
  fill(lightRandR, lightRandG, lightRandB);rect(175, 275, 25, 50);
  fill(lightRandR, lightRandG, lightRandB);rect(150, 325, 25, 50);
  fill(lightRandR, lightRandG, lightRandB);rect(125, 375, 25, 25);
  // generate yellow rectangles
  fill(medRandR, medRandG, medRandB);rect(150, 150, 125, 25);
  fill(medRandR, medRandG, medRandB);rect(150, 175, 100, 25);
  fill(medRandR, medRandG, medRandB);rect(125, 200, 100, 25);
  fill(medRandR, medRandG, medRandB);rect(125, 225, 75, 25);
  fill(medRandR, medRandG, medRandB);rect(75, 250, 125, 25);
  fill(medRandR, medRandG, medRandB);rect(200, 275, 50, 25);
  fill(medRandR, medRandG, medRandB);rect(200, 300, 25, 25);
  fill(medRandR, medRandG, medRandB);rect(175, 325, 25, 25);
  // generate dark yellow rectangles
  fill(brightRandR, brightRandG, brightRandB);rect(300, 125, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(275, 150, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(250, 175, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(225, 200, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(200, 225, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(100, 425, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(125, 400, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(150, 375, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(175, 350, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(125, 400, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(100, 425, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(75, 450, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(200, 325, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(225, 300, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(250, 275, 25, 25);
  fill(brightRandR, brightRandG, brightRandB);rect(275, 250, 25, 25);
}