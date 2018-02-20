/***************************************
*********Silas Gibbins. CTC*************
*******WS 2018. Assignment-3.***********
*********Initial code, only*************
*********programmed in with*************
*********Q and W key presses.***********
***************************************/

void setup() {
  size(1200, 600);
  background(0);
  rectMode(CENTER);
  rect(width/2, height/2, 800, 400);
}

void draw() {
  rectMode(CORNER);
    if (keyPressed){
    if (key == 'q' || key == 'w') {
      fill(0);
      rect(200, 100, 100, 100);
    } else if (key != 'q') {
      fill(255);
      rect(200, 100, 100, 100);
    }
    if (key == 'w') {
      fill(0);
      rect(300, 100, 100, 100);
    } else if(key != 'w') {
      fill(255);
      rect(300, 100, 100, 100);
    }
    }
}

void keyReleased() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/2, 800, 400);
}