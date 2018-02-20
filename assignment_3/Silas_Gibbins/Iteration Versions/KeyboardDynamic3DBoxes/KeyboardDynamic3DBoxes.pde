/***************************************
***********Silas Gibbins. CTC***********
*********WS 2018. Assignment-3.*********
*******Follows from Keyboard.pde,*******
*******KeyboardDynamic(1).pde,**********
*******and KeyboardDynamic3D.pde.*******
***********Intermediate step.***********
**********Thinking about ways***********
*********of 'resetting pixels'**********
********to white. The potential*********
************extension was to************
************have each square************
**********raise a certain height********
********and when a key is pressed*******
*********the height is reduced**********
***********a certain amount.************
***************************************/

char[] fullKeyboard= new char[10 + 26 + 14 + 3]; //numbers + alphabet + extraneous
Key keyCall;

int k;
char ch;

void setup() {
  size(1300, 420, P3D);
  background(255);
  rectMode(CENTER);
  noStroke();
  /*
  rect(width/2, height/2, 1180, 320);
   */
  fullKeyboard = fullKeyboardArray(fullKeyboard);
  frameRate(5);
  perspective();
}

//continually checking if a key is pressed and what key it is 
void draw() {
  if (keyPressed) {
    for (k = 0; k < fullKeyboard.length; k++) {
      if (key == fullKeyboard[k]) {
        keyCall = new Key(fullKeyboard, k);
        keyCall.Keys();
      }
    }
  }
  fill(120, 2);
  translate(590, 50, -100);
  rotateX(-.5);
  box(1140, 20, 80);
  translate(50, 120, -100);
  box(1200, 20, 80);
}

//resetting the display if a key is not pressed
/*void keyReleased() {
 fill(255); 
 rectMode(CENTER); 
 rect(width/2, height/2, 1180, 320);
 }
 */


//filling up the keyboard array
char[] fullKeyboardArray(char[] fullKeyboard) {
  String inOrder = "`1234567890-=\b\tqwertyuiop[]\rasdfghjkl;'#\r\\zxcvbnm,./";
  char c = inOrder.charAt(0);
  fullKeyboard = inOrder.toCharArray();
  fullKeyboard[27] = '\r';
  fullKeyboard[40] = '\r';
  printArray(fullKeyboard);
  return(fullKeyboard);
}