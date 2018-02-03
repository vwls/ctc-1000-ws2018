import processing.serial.*;

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
String mode = "null"; // used for displaying the mode

// variable for second window
PWindow win;

public void settings() {
  size(500,500);
}

void setup() {

  // initial settings for the sketch
  stroke(0);
  strokeWeight(4);
  background(255);
  size(500, 500);
  win = new PWindow();

  // arduino inputs setup
  irVal = null;
  xVal = width/2;
  yVal = height/2;
  pointX = width/2;
  pointY = height/2;

  // setup for serial communication
  String portname = Serial.list()[11];
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

    if (irVal.equals("FF6897")) { // 0
      mode = "zero";
      stroke(0);
    }
    if (irVal.equals("FF30CF")) { // 1
      mode = "one";
      stroke(255, 0, 0);
    }
    if (irVal.equals("FF18E7")) { // 2
      mode = "two";
      stroke(0, 0, 255);
    }
    if (irVal.equals("FF7A85")) { // 3
      mode = "three";
      stroke(0, 255, 0);
    }
    if (irVal.equals("FF02FD")) { // play
      mode = "null";
      endIt();
    }
  }

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

  // draws the point
  point(pointY, pointX);
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