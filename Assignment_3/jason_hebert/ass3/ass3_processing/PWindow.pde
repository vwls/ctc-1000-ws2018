class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
  void settings() {
    size(500,200);
  }
  
   void setup() {
     background(150);
   }
   
   void draw() {
   
     // create banner
  fill(0);
  rect(0, 0, width, 50);

  if (!mode.equals("null")) {
    String modeText = "mode: " + mode;

    // mode number (according to number on pad)
    println(modeText);
    textAlign(CENTER);
    fill(255);
    text(modeText, width/2, 25);
  }
   }
   
}

  
   