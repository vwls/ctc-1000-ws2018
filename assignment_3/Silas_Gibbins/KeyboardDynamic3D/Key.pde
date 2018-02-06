class Key {
  char now;
  int n;

  Place Number;

  Key (char fullKeyboard[], int k) {
  }

  void Keys() {
    rectMode(CORNER);
    fill(0);
    Number = new Place(fullKeyboard, k);
    Number.drawNumber();
  }
}