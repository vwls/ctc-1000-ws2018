class Place {
  int margin = 50;
  int reg = 80;
  int small = 60;
  int smallShift = 120;
  int bigShift = 180;
  int capsLock = 160;
  int backSpace = 140;
  int tab = 130;

  int row1 = margin;
  int row2 = reg *1 + margin;
  int row3 = reg *2 + margin;
  int row4 = reg *3 + margin;



  Place(char[] fullKeyboard, int k) {
  }

  Place() {
  }

  void drawNumber() {

    //top row of keyboard from ` to +, including 0-9
    if (k < 13) {
      rect(margin + reg*k, row1, reg, reg);
    }

    //backspace
    if (k == 13) {
      rect(margin + reg*k, row1, backSpace, reg);
    }

    //tab
    if (k==14) {
      rect(margin, row2, tab, reg);
    }

    //first row of characters, QWERTY
    if (k > 14 && k < 25) {
      rect(margin + tab + reg * (k-15), row2, reg, reg);
    }

    // [ ]
    if (k == 25 || k == 26) {
      rect(margin + tab + reg * 10 + small * (k-25), row2, small, reg);
    }

    // enter / return
    if (keyCode == ENTER) {
      rectMode(CORNER);
      fill(0);
      println("reading enter");
      rect(margin + tab + reg * 10 + small * 2, row2, backSpace, reg);
      rect(margin + capsLock + reg * 10 + small * 2, row3, reg + 20, reg);
    }

    //capsLock
    if (keyCode == 20) {
      rectMode(CORNER);
      fill(0);
      rect(margin, row3, capsLock, reg);
    }

    // A-L and ;
    if (k > 26 && k < 37) {
      rect(margin + capsLock + reg * (k-27), row3, reg, reg);
    }

    // ' #
    if (k == 37 || k == 38) {
      rect(margin + capsLock + reg * 10 + small * (k-37), row3, small, reg);
    }

    //shift
    if (keyCode == 16) {
      println("reading shift");
      rectMode(CORNER);
      fill(0);
      rect(margin, row4, smallShift, reg);
      rect(margin + smallShift + reg * 11, row4, bigShift, reg);
    }

    //Z-M and , . /
    if (k > 38 && k < 50) {
      rect(margin + smallShift + reg * (k- 39), row4, reg, reg);
    }
  }
}