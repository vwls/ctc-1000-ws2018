class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(600, 300);
  }

  void setup() {
    background(255);
    noStroke();
    rectMode(CORNER);
    smooth();
  }

  void draw() {


    // set background to grey
    background(255);
    color rectColor = color(255, 255, 255, 200);

    if (!mode.equals("null")) {

      textAlign(CENTER);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // populate all mode colors
      fill(rectColor);
      stroke(150);
      rect(10, 50, 180, 230, 10);
      fill(255);
      strokeWeight(1);
      int textColor = 150;
      textSize(15);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // default colors
      color[] defaultColors = mode.map.get(0);
      int xStartDefault = 50;
      for (int i=0; i < defaultColors.length; i++) {
        fill(defaultColors[i]);
        rect(xStartDefault, 65, 20, 25, 2);
        xStartDefault += 25;
      }
      fill(textColor);
      text("0", 40, 82);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // first color set
      color[] firstColors = mode.map.get(1);
      int xStartFirst = 50;
      for (int i=0; i < firstColors.length; i++) {
        fill(firstColors[i]);
        rect(xStartFirst, 100, 20, 25, 2);
        xStartFirst += 25;
      }
      fill(textColor);
      text("1", 40, 118);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // second color set
      color[] secondColors = mode.map.get(2);
      int xStartSecond = 50;
      for (int i=0; i < secondColors.length; i++) {
        fill(secondColors[i]);
        rect(xStartSecond, 135, 20, 25, 2);
        xStartSecond += 25;
      }
      fill(textColor);
      text("2", 40, 153);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // third color set
      color[] thirdColors = mode.map.get(3);
      int xStartThird = 50;
      for (int i=0; i < thirdColors.length; i++) {
        fill(thirdColors[i]);
        rect(xStartThird, 170, 20, 25, 2);
        xStartThird += 25;
      }
      fill(textColor);
      text("3", 40, 187);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // fourth color set
      color[] fourthColors = mode.map.get(4);
      int xStartFourth = 50;
      for (int i=0; i < fourthColors.length; i++) {
        fill(fourthColors[i]);
        rect(xStartFourth, 205, 20, 25, 2);
        xStartFourth += 25;
      }
      fill(textColor);
      text("4", 40, 222);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // fifth color set
      color[] fifthColors = mode.map.get(5);
      int xStartFifth = 50;
      for (int i=0; i < fifthColors.length; i++) {
        fill(fifthColors[i]);
        rect(xStartFifth, 240, 20, 25, 2);
        xStartFifth += 25;
      }
      fill(textColor);
      text("5", 40, 257);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // populate color field interface (middle section)
      fill(rectColor);
      rect(200, 50, 200, 170, 10);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // color 1 
      fill(mode.getColorFromNum(0));
      rect(215, 65, 50, 80, 5);
      fill(255);
      rect(225, 75, 30, 30, 5);
      fill(textColor);
      text("1", 240, 95);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // color 2
      fill(mode.getColorFromNum(1));
      rect(275, 65, 50, 80, 5);
      fill(255);
      rect(285, 75, 30, 30, 5);
      fill(textColor);
      text("2", 300, 95);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // color 3
      fill(mode.getColorFromNum(2));
      rect(335, 65, 50, 80, 5);
      fill(255);
      rect(345, 75, 30, 30, 5);
      fill(textColor);
      text("3", 360, 95);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // color 4
      fill(mode.getColorFromNum(3));
      rect(215, 155, 80, 50, 5);
      fill(255);
      rect(225, 165, 30, 30, 5);
      fill(textColor);
      text("4", 240, 185); 

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // color 5
      fill(mode.getColorFromNum(4));
      rect(305, 155, 80, 50, 5);
      fill(255);
      rect(315, 165, 30, 30, 5);
      fill(textColor);
      text("5", 330, 185);

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // indicate which mode is currently selected

      fill(255, 0, 0);

      if (mode.modeNum == 0) {
        triangle(20, 70, 30, 78, 20, 85);
      } else if (mode.modeNum == 1) {
        triangle(20, 105, 30, 113, 20, 120);
      } else if (mode.modeNum == 2) {
        triangle(20, 140, 30, 148, 20, 155);
      } else if (mode.modeNum == 3) {
        triangle(20, 175, 30, 183, 20, 190);
      } else if (mode.modeNum == 4) {
        triangle(20, 210, 30, 218, 20, 225);
      } else if (mode.modeNum == 5) {
        triangle(20, 245, 30, 253, 20, 260);
      }

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // indicate which color is currently selected

      ellipseMode(CENTER);

      if (mode.currentColor == 0) {
        fill(255);
        ellipse(240, 125, 20, 20);
        fill(255, 0, 0);
        ellipse(240, 125, 15, 15);
      } else if (mode.currentColor == 1) {
        fill(255);
        ellipse(300, 125, 20, 20);
        fill(255, 0, 0);
        ellipse(300, 125, 15, 15);
      } else if (mode.currentColor == 2) {
        fill(255);
        ellipse(360, 125, 20, 20);
        fill(255, 0, 0);
        ellipse(360, 125, 15, 15);
      } else if (mode.currentColor == 3) {
        fill(255);
        ellipse(275, 180, 20, 20);
        fill(255, 0, 0);
        ellipse(275, 180, 15, 15);
      } else if (mode.currentColor == 4) {
        fill(255);
        ellipse(365, 180, 20, 20);
        fill(255, 0, 0);
        ellipse(365, 180, 15, 15);
      }

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // indicate which functionality is in place
      fill(rectColor);
      rect(200, 230, 200, 50, 10);

      // text
      fill(textColor);
      text("color", 265, 260);
      text("mode", 360, 260);

      // "radio" buttons
      fill(255);
      ellipse(225, 255, 20, 20);
      ellipse(315, 255, 20, 20);

      // indicates which "radio" button is "checked"
      fill(255, 0, 0);
      if (functionColor) {
        ellipse(225, 255, 15, 15);
      } else if (functionMode) {
        ellipse(315, 255, 15, 15);
      }

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // indication for noise
      noFill();
      rect(410, 50, 180, 75, 10);

      // text
      fill(textColor);
      text("noise", 500, 75);
      text("off", 450, 105);
      text("on", 550, 105);

      // indicate if on or off

      noFill();
      stroke(255, 0, 0);

      if (!noiseOn) {
        ellipse(450, 100, 50, 30);
      } else {
        ellipse(550, 100, 50, 30);
      }

      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      // controler information
      noFill();
      stroke(150);
      rect(410, 135, 180, 145, 10);

      // buttons
      fill(230);
      ellipse(440, 160, 25, 25);
      ellipse(440, 205, 25, 25);
      ellipse(440, 250, 25, 25);
      ellipse(520, 160, 25, 25);
      ellipse(520, 205, 25, 25);

      // button displays
      fill(100);
      textSize(12);
      text("EQ", 440, 165);
      text("ST", 440, 210);
      // play/pause
      triangle(433,245,440,250,433,255);
      rect(440,245,2,10);
      rect(445,245,2,10);
      // up arrow
      triangle(520,155,525,165,515,165);
      // down arrow
      triangle(520,210,525,200,515,200);
      
      // commands text
      fill(textColor);
      textLeading(10);
      text("color\nmode", 475, 160);
      text("mode\nmode", 475, 203);
      text("noise\non", 558, 160);
      text("noise\noff", 558, 203);
      
      textSize(15);
      text("post to twitter", 510, 255);
      
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      
      // header
      fill(245);
      stroke(150);
      rect(10,10,580,30,10);
      fill(textColor);
      textSize(20);
      text("~ ~ ~ ~ ~ ~ {  experimental etch-a-sketch  } ~ ~ ~ ~ ~ ~",width/2,32);
      
      
    }

    smooth();
  }
}