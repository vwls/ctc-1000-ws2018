int totalPages = 348;
int pageStart = 20;
int pageEnd = 40;
int positionX = 0;
int positionY = 0;

boolean mouseHover = false;


void setup() {
  //ask for user input here
  size(548, 300);
  background(120);
  rectMode(CENTER);
  rect(width/2, height/2, totalPages, 100);
  int pageStart = 20;
  int pageEnd = 40;
  line(100 + pageStart, 100, 100 + pageStart, 200);
  line(100 + pageEnd, 100, 100 + pageEnd, 200);
  rectMode(CORNER);
  fill(0);
  rect(100 + pageStart, 100, pageEnd - pageStart, 100);
}

void draw() {
  /*if (mouseHover == true) {
    println("yes");
  }*/
}

void mousePressed() {
  if (mouseX > 100 + pageStart && mouseX< 100 + pageEnd && mouseY>100 && mouseY<200) {
    println("You've already read pages " + pageStart + " - " + pageEnd);
  }
}


/*boolean mouseHover (int pageStart, int pageEnd) {
  if (mouseX >= 100 + 20 && mouseX <= 100 + 40 && 
    mouseY >= 100 && mouseY <= 200) {
    return true;
  } else {
    return false;
  }
}
*/