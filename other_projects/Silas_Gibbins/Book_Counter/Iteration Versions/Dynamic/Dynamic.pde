PFont font; 
int totalPages = 661;
int pageStart = 20;
int pageEnd = 40;
Pages p1 = new Pages(20, 40);
Pages p2 = new Pages(100, 105);
Pages p3 = new Pages(300, 340);


void setup() {
  size(1322, 400);
  background(120);
  rectMode(CENTER);
  noStroke();
  rect(width/2, height/2, totalPages * 2, 200);
  p1.pageInput();
  p2.pageInput();
  p3.pageInput();
}

void draw() {
  //if(mousePressed){ implement this if you want to require a click and not hover
  p1.mousePressed();
  p2.mousePressed();
  p3.mousePressed();
}