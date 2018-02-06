/***************************************
***********Silas Gibbins. CTC***********
*********WS 2018. Assignment-3.*********
*******Follows from Keyboard.pde********
**********and KeyboardDynamic.**********
***********This is the final************
***********version of a 2D 'key*********
********tracker' effectively.***********
************Nearly the whole************
**********keyboard is mapped,***********
***********but the Enter key************
*********requires CTRL + ENTER**********
**************to display.***************
***************************************/

char[] fullKeyboard= new char[10 + 26 + 14 + 3]; //numbers + alphabet + extraneous
Key keyCall;
Place placeCall;

int k;
char ch;

boolean otherKey;

void setup() {
  size(1280, 420);
  background(0);
  rectMode(CENTER);
  noStroke();
  rect(width/2, height/2, 1180, 320);
  fullKeyboard = fullKeyboardArray(fullKeyboard);
}

//continually checking if a key is pressed and what key it is 
void draw() {
  if (keyPressed) {
    if (keyCode == ENTER || keyCode == SHIFT || keyCode == 20) {
        //println("enter pressed");
        placeCall = new Place();
        placeCall.drawNumber();
        fill(255);
      }
    for (k = 0; k < fullKeyboard.length; k++) {
      if (key == fullKeyboard[k]) {
        keyCall = new Key(fullKeyboard, k);
        keyCall.Keys();
      }
    }
  }
}



//resetting the display if a key is not pressed
void keyReleased() { 
  fill(255);
  rectMode(CENTER); 
  rect(width/2, height/2, 1180, 320);
}


//filling up the keyboard array
char[] fullKeyboardArray(char[] fullKeyboard) {
  String inOrder = "`1234567890-=\b\tqwertyuiop[]asdfghjkl;'#\\zxcvbnm,./";
  char c = inOrder.charAt(0);
  fullKeyboard = inOrder.toCharArray();
  //fullKeyboard[27] = '\r';
  //fullKeyboard[40] = '\r';
  printArray(fullKeyboard);
  return(fullKeyboard);
}