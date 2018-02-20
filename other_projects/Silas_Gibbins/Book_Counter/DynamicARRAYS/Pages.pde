class Pages {
  int pageStart;
  int pageEnd;

//constructor!
  Pages(int tempStart, int tempEnd) {
    pageStart = tempStart;
    pageEnd = tempEnd;
  }


//drawing each rectangle based off of pageStart and pageEnd
  void pageInput() {
    rectMode(CORNER);
    //println(pageStart, pageEnd); test line to check variables passed through
    fill(0);
    rect(pageStart * 2, 100, (pageEnd - pageStart) *2, 200);
  }
  
//calculates percentage of  
  int pagePercentage() {
    return pageEnd - pageStart;
  }

  void mousePressed() {

    if (mouseX > pageStart*2 && mouseX< pageEnd*2 && mouseY>100 && mouseY<300) {
      rectMode(CORNER);
      fill(120);
      rect(90, 30, 400, 30);
      fill(0);
      textSize(20);
      text("You've already read pages " + pageStart + " - " + pageEnd, 100, 50);
    }
  }
}