class system {
  ArrayList<Star> s;
  system() {
    s = new ArrayList<Star>();
  }
  void run() {
    translate(mouseX, mouseY);
    if (mousePressed) {


      s.add(new Star());
    }

    for (int i = s.size()-1; i >= 0; i--) {
      Star star = s.get(i);
      star.update();
      star.show();

      if (star.isDead()) {
        s.remove(i);
      }
    }
  }
}