class Place {
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

  float z;


  Place(char[] fullKeyboard, int k) {
  }


  void drawNumber() {

    //top row of keyboard from ` to +, including 0-9
    if (k < 13) {
      rect3D(margin + reg*k, row1, reg, reg);
    }

    //backspace
    if (k == 13) {
      rect3D(margin + reg*k, row1, backSpace, reg);
    }

    //tab
    if (k==14) {
      rect3D(margin, row2, tab, reg);
    }

    //first row of characters, QWERTY
    if (k > 14 && k < 25) {
      rect3D(margin + tab + reg * (k-15), row2, reg, reg);
    }

    // [ ]
    if (k == 25 || k == 26) {
      rect3D(margin + tab + reg * 10 + small * (k-25), row2, small, reg);
    }

    // enter / return NOT WORKING
    if (k == 27 || k == 40) {
      println("reading enter");
      rect3D(margin + tab + reg * 10 + small * 2, row2, backSpace, reg);
      rect3D(margin + capsLock + reg * 10 + small * 2, row3, reg + 20, reg);
    }

    //capsLock NOT WORKING

    // A-L and ;
    if (k > 27 && k < 38) {
      rect3D(margin + capsLock + reg * (k-28), row3, reg, reg);
    }

    // ' #
    if (k == 38 || k == 39) {
      rect3D(margin + capsLock + reg * 10 + small * (k-38), row3, small, reg);
    }

    //shift NOT WORKING

    //Z-M and , . /
    if (k > 40 && k < 52) {
      rect3D(margin + smallShift + reg * (k-41), row4, reg, reg);
    }
  }

  void rect3D(int translateX, int translateY, int rectWidth, int rectHeight) {
    fill(120, 5);
    pushMatrix();
    translate(translateX, translateY, -100);
    rotateX(-.5);
    box(rectWidth, 20, rectHeight);
    popMatrix();
  }
  
}