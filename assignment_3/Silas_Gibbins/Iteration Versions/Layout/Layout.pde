/***************************************
***********Silas Gibbins. CTC***********
*********WS 2018. Assignment-3.*********
*******Follows from Keyboard.pde,*******
*******KeyboardDynamic(1).pde,**********
**and KeyboardDynamic3D(Boxes).pde.*****
*********Experimental reference*********
**help to get to KeyboardDynamicLayout,*
************figuring out P3D************
***********better. Press the************
***********keys '+' and '-' to**********
***********see functionality.***********
***************************************/

import processing.dxf.*;

boolean record;

float zHeight = 10; //make an array?
int margin = 50;
int reg = 80;
int small = 60;
int smallShift = 120;
int bigShift = 120;
int capsLock = 160;
int backSpace = 140;
int tab = 130;

int row1 = margin;
int row2 = reg *1 + margin;
int row3 = reg *2 + margin;
int row4 = reg *3 + margin;


void setup() {
  size(1280, 420, P3D);
  fill(100);
  stroke(255);
  ortho();
  lights();
}

void draw() {
  if (record) {
    beginRaw(DXF, "output1.dxf");
  }

  // Do all your drawing here
  background(200);
  if (keyPressed) {
    if (key == '+' || key == '=') {
      zHeight++;
    } else if (key == '-' && zHeight > 1) {
      zHeight--;
      
    }
  }
  pushMatrix();
  rotateX(-PI/6);
  rotateY(PI/3);
  translate(margin + zHeight/2 + row1, 0, 300);
  box(reg, zHeight, 1180);
  popMatrix();
  pushMatrix();
  rotateX(-PI/6);
  rotateY(PI/3);
  translate(margin + zHeight/2 +row2, 0, 300);
  box(reg, zHeight, 1180);
  popMatrix();
  if (record) {
    endRaw();
    record = false;
  }
}
void keyPressed() {
  // Use a key press so that it doesn't make a million files
  if (key == 'R') {
    record = true;
  }
}