import processing.video.*;

int cellSize = 20;

int cols, rows;

Capture video;

void setup() {
  size(1920, 1080);

  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);

  video = new Capture(this, width, height);
  
  video.start();  

  background(0);
}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
    
    background(0);

    for (int i = 0; i < cols;i++) {
  
      for (int j = 0; j < rows;j++) {

        // pixel location
        int x = i * cellSize;
        int y = j * cellSize;
        int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image

        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        
        color c = color(r, g, b, 100);
        float sz = (brightness(c) / 255.0) * cellSize;
        fill(c);
        noStroke();
        rect(x + cellSize/2, y + cellSize/2, sz, sz);
      }
    }
  }
}
void mouseReleased(){  
  saveFrame("../collage_generator/data/portrait-#####.jpg");
}