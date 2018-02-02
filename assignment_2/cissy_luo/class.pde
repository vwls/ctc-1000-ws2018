class bbl {

  float rad;
  float xpos;
  float ypos;
  float xv=2;
  float yv=1;
  float xlim;
  float ylim;
  int xd=1;
  int yd=1;

  bbl( float radius, float x, float y, float xlimit, float ylimit) {
    rad = radius;
    xpos = x;
    ypos = y;
    xlim = xlimit;
    ylim = ylimit;
  }


  void move() {
    xpos=xpos+(xv*xd);
    if (xpos>xlim-rad/2||xpos<(width-xlim)+rad/2) {
      xd *=-1;
    }

    ypos=ypos+(yv*yd);
    if (ypos>ylim-rad/2||ypos<(height-ylim)+rad/2) {
      yd *=-1;
    }
  }

  void display() {
    distance = dist (mouseX, mouseY, 500, 500);
    if (distance<=250) {
        fill (208, 188, 39, 200);      
        stroke(140, 244, 90, 200);
        strokeWeight(20);
        ellipse(xpos, ypos, rad, rad);
      }
 
    else {
      fill (random(0, 255), random(0, 255), random(0, 255), 200);
      stroke(90, 244, 255, 200);
      rect(xpos, ypos, rad, rad);
    }
  }
  }