import processing.serial.*;
import java.util.Map;

// variables for the serial communications
int end = 10;
String serial; 
Serial port;

// variables for inputs and modes
String irVal; // hex value from ir input
float xVal; // value from joystick x
float yVal; // value from jostick y
float pointX; // x location of point
float pointY; // y location of point
String[] inputs = {" ", " ", " "}; // stores the inputs from the arduino

// variable for second window
PWindow win;

// variable for color modes
Mode mode;
boolean functionMode;
boolean functionColor;

// variable for noise
boolean noiseOn;
float strokeOff = 0.0;
float xoff = 0.0;
float yoff = 0.0;

public void settings() {
  size(500, 500);
}

void setup() {

  // initial settings for the sketch
  stroke(0);
  strokeWeight(4);
  background(255);
  // size(500, 500);
  win = new PWindow();

  // arduino inputs setup
  irVal = null;
  xVal = width/2;
  yVal = height/2;
  pointX = width/2;
  pointY = height/2;

  // setup color modes
  mode = new Mode();
  stroke(mode.getColor());
  functionMode = true;
  functionColor = false;

  // setup noise
  noiseOn = false;

  // setup for serial communication
  String portname = Serial.list()[3];
  port = new Serial(this, portname, 9600);
  port.clear();
  serial = null;
}

void draw() {

  // checks to see if arduino is connected to 
  // processing and correctly sending information
  while (port.available() > 0) {
    serial = port.readStringUntil(end);
  }

  // if the serial can be read, set values of inputs array
  if (serial != null) {
    inputs = split(serial, ",");
    xVal = reMap(int(inputs[0]));
    yVal = reMap(int(inputs[1]));
    irVal = inputs[2];
  } 

  // print input information into console
  println(" ~~~~~~ ");
  println("xVal is: " + xVal);
  println("yVal is: " + yVal);
  println("ir value is: " + irVal);

  /* * * * * * * * * * * * * * * * * * * * * * * * *
   * * changes modes depending on button pressed * *
   * * * * * * * * * * * * * * * * * * * * * * * * */
  if (irVal != null) {
    irVal = trim(irVal);

    switch(irVal) {
    case "FF9867": // eq button
      functionMode = false;
      functionColor = true;
      break;
    case "FFB04F": // st/rept button
      functionMode = true;
      functionColor = false;
      break;
    case "FF6897": // 0 button
      if (functionMode) { 
        mode.modeNum = 0;
      } 
      break;
    case "FF30CF": // 1 button
      if (functionMode) { 
        mode.modeNum = 1;
      }
      if (functionColor) { 
        mode.currentColor = 0;
      }
      break;
    case "FF18E7": // 2 buton
      if (functionMode) { 
        mode.modeNum = 2;
      }
      if (functionColor) { 
        mode.currentColor = 1;
      }
      break;
    case "FF7A85": // 3 button
      if (functionMode) { 
        mode.modeNum = 3;
      }
      if (functionColor) { 
        mode.currentColor = 2;
      }
      break;
    case "FF10EF": // 4 button
      if (functionMode) { 
        mode.modeNum = 4;
      }
      if (functionColor) { 
        mode.currentColor = 3;
      }
      break;
    case "FF38C7":  // 5 button
      if (functionMode) { 
        mode.modeNum = 5;
      }
      if (functionColor) { 
        mode.currentColor = 4;
      }
      break;
    case "FF906F": // up button
      noiseOn = true;
      break;
    case "FFE01F": // down button
      noiseOn = false;
      break;
    case "FF02FD":
      endIt();
      break;
    default:
      break;
    }
 
}
println("functionMode: " + functionMode);

stroke(mode.getColor());

/* * * * * * * * * * * * * * * * * * * * * * * * *
 * creates points according to joystick location *
 * * * * * * * * * * * * * * * * * * * * * * * * */

// determines direction of x movement
if (xVal >= width/2 + 100) {
  pointX -= 1;
} else if (xVal <= width/2 - 100) {
  pointX += 1;
}

// determines direction of y movement
if (yVal >= height/2 + 100) {
  pointY += 1;
} else if (yVal <= height/2 - 100) {
  pointY -= 1;
}

// prevents the cursor from going out of bounds
if (pointX > width) pointX = width;
if (pointX < 0) pointX = 0;
if (pointY > height) pointY = height;
if (pointY < 0) pointY = 0;

// noise functionality
if (noiseOn) {
  strokeOff += 0.01;
  xoff += 0.1;
  yoff += 0.1;
  strokeWeight(noise(strokeOff) * 10);

  // draw the point 
  point((pointX + (noise(xoff) * 10)), (pointY + (noise(yoff) * 10)));
} else {
  strokeWeight(4);

  // draw the point
  point(pointX, pointY);
}
}


// remaps the joystick input according to width/height of sketch
float reMap(int x) {
  float y = map(x, 0, 1023, 0, width);
  return y;
}

// terminates the sketch and outputs an image
void endIt() {
  save("output.png");
  exit();
}