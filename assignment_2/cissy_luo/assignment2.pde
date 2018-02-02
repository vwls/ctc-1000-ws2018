
String t = "Cissy Luo";
float distance;
float distance2;
PShape hexagon;
float randomNum = random(50, 300);
int x = 10;
int y = 10;
boolean isOn = true;
bbl b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12;

void setup() {
  size (1000, 1000);
  frameRate (10);

  hexagon=createShape();

  rectMode(CENTER);

  b1 = new bbl(50, 500, 500, 750, 750);
  b2 = new bbl(70, 300, 300, width, height);
  b3 = new bbl(100, 355, 450, 750, 750);
  b4 = new bbl(60, 750, 800, width, height);
  b5 = new bbl(40, 670, 450, 750, 750);
  b6 = new bbl(30, 250, 100, width, height);
  b7 = new bbl(100, 400, 300, 750, 750);
  b8 = new bbl(80, 800, 700, width, height);
  b9 = new bbl(50, 400, 300, 750, 750);
  b10 = new bbl(30, 800, 100, width, height);
  b11 = new bbl(50, 450, 370, 750, 750);
  b12 = new bbl(90, 700, 130, width, height);
}

void draw() {
  exportImage(isOn);
  background (130, 90, 230);
  
  noStroke();
  fill(255, 110, 0);
  float number = random(1);
  float likelihood = 0.5;
  if (number < likelihood) {
    distance2 = dist (mouseX, mouseY, 0, 0);
    if (distance2 < 300) {
      rect(x, y, x+40, y+40);
    } else {
      rect(x+30, y, x, y+60);
    }
    x = x+100;
    resetline();
    reset();
  }
  hexagon.beginShape();
  hexagon. noStroke();
  hexagon.fill(220, 199, 50);
  hexagon.vertex(500, 500);
  hexagon.vertex(700, 500);
  hexagon.vertex(900, 700);
  hexagon.vertex(700, 900);
  hexagon.vertex(500, 900);
  hexagon.vertex(300, 700);
  hexagon.vertex(500, 500);
  hexagon.endShape();

  strokeWeight(30);
  stroke(50, 255, 199);
  fill (230, 90, 130);
  pushMatrix();
  translate (500, 500);
  rotate (degrees(second()));
  rect (250, 250, 500,500); 
  popMatrix();

  shape(hexagon, -100, -200);

  stroke(50, 210, 90);
  fill(23, 200, 170, 100);
  pushMatrix();
  translate (500, 500);
  rotate (-degrees(second()));
  rect(300, 200, 600, 400);
  popMatrix();

  b1. move();
  b1. display();
  b2. move();
  b2. display();
  b3. move();
  b3. display();
  b4. move();
  b4. display();
  b5. move();
  b5. display();
  b6. move();
  b6. display();
  b7. move();
  b7. display();
  b8. move();
  b8. display();
  b9. move();
  b9. display();
  b10. move();
  b10. display();
  b11. move();
  b11. display();
  b12. move();
  b12. display();

  textSize(100);
  text(t, 265, 500);

  textSize(110);
  text(t, 255, 450);

  textSize(90);
  text(t, 270, 550);
}

void resetline() {
  if (x>width) {
    x=0;
    y=y+100;
}}

void reset(){
   if (y>height){
    x=0;
    y=0;
  }
 
}

void exportImage(boolean isOn) {
  if (mousePressed) {
    println("got click");

    if (isOn == true) {
      println("SAVING IMAGE");
      saveFrame("screenshot###-####.png");
    } else {
      println("If you want to save output images, pass 'true' in exportImage function call");
      return;
    }
  }
}