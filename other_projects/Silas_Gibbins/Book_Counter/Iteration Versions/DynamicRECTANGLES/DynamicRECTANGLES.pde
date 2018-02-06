PFont font; 
int totalPages = 661;
int pageStart = 20;
int pageEnd = 40;
int positionX = 0;
int positionY = 0;


void setup() {
  size(1322, 400);
  background(120);
  rectMode(CENTER);
  noStroke();
  rect(width/2, height/2, totalPages * 2, 200);
  //page inputs, call function pageInput(start page #, end page number)
  pageInput(20, 40);
  pageInput(600, 604);
  pageInput(450, 459);
}

void draw() {
}

void mousePressed() {
  rectMode(CORNER);
    fill(120);
    rect(90, 30, 400, 30);
  if (mouseX > pageStart*2 && mouseX< pageEnd*2 && mouseY>100 && mouseY<300) {
    fill(0);
    textSize(20);
    text("You've already read pages " + pageStart + " - " + pageEnd, 100, 50);
  }
  if (mouseX > 600*2 && mouseX< 604*2 && mouseY>100 && mouseY<300) {
    fill(0);
    textSize(20);
    text("You've already read pages " + 600 + " - " + 604, 100, 50);
  }
}

void pageInput(int pageStart, int pageEnd) {
  rectMode(CORNER);
  fill(0);
  rect(pageStart * 2, 100, (pageEnd - pageStart) *2, 200);
}