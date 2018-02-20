class Key {
  char now;

  Key (char temp) {
    now = temp;
  }

  void Keys() {
    rectMode(CORNER);
    if (now == 'e') {
      fill(0);
      rect(400, 100, 100, 100);
    } else if (now != 'e') {
      fill(255);
      rect(300, 100, 100, 100);
    }
    if (now == 'q') {
      fill(0);
      rect(50, 100, 100, 100);
    } else if (now != 'q') {
      fill(255);
      rect(300, 100, 100, 100);
    }
    if (now == 'w') {
      fill(0);
      rect(300, 100, 100, 100);
    } else if (now != 'w') {
      fill(255);
      rect(300, 100, 100, 100);
    }
  }
}