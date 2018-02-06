PFont font; 
int totalPages = 661;

int numEntries = 4;
Pages[] pages = new Pages[numEntries];
float percentage;


void setup() {
  //setting up canvas and white rectangle representing the book
  size(1322, 400);
  background(120);
  rectMode(CENTER);
  noStroke();
  rect(width/2, height/2, totalPages * 2, 200);

  //manual entry of pages that you've read in the form Pages(startPage, endPage)
  pages[0] = new Pages(20, 40);
  pages[1] = new Pages(100, 105);
  pages[2] = new Pages(300, 400);
  pages[3] = new Pages(205, 210);

  //runs the function to make the rectangles across all entries in the array
  for (int i = 0; i < numEntries; i++) {
    pages[i].pageInput();
  }

  //runs the function to calculate percentage read across all entries in the array
  //first adds the total number of pages read, then later that value is compared against the total number of pages in the book
  for (int i = 0; i < 3; i++) {
    percentage += pages[i].pagePercentage();
  }
  fill(0);
  textSize(20);
  text("You are " + round(percentage/totalPages * 100 * 10) *.1 + "% of the way through the book", 100, 20);
}

void draw() {
  //if(mousePressed){ implement this 'if' if you want to require click functionality and not hover
  //runs the 
  for (int i = 0; i < numEntries; i++) {
    pages[i].mousePressed();
  }
}