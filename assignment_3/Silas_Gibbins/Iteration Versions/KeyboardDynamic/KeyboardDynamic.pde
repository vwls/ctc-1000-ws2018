/***************************************
***********Silas Gibbins. CTC***********
*********WS 2018. Assignment-3.*********
*******Follows from keyboard.pde.*******
***********This code is only************
***********programmed for Q,************
***********W and E but contains*********
************the architecture************
***********for whole keyboard***********
************expansion.******************
***************************************/

char[] fullKeyboard= new char[10 + 26 + 14 + 3]; //numbers + alphabet + extraneous
Key call;

int i;
int j;
int k;
char ch;
char filler;

void setup() {
  size(1100, 450);
  background(0);
  rectMode(CENTER);
  noStroke();
  rect(width/2, height/2, 1000, 350);
  while (i < 26) {
    for (ch = 'a'; ch <= 'z'; ch ++) {
      fullKeyboard[i] = ch;
      i++;
    }
  }
  while (j < 10) {
    for (ch = '0'; ch <= '9'; ch ++) {
      fullKeyboard[j + 26] = ch;
      j++;
    }
  }
  fullKeyboard[36] = '`';
  fullKeyboard[37] = '-';
  fullKeyboard[38] = '=';
  fullKeyboard[39] = '[';
  fullKeyboard[40] = ']';
  fullKeyboard[41] = ';';
  fullKeyboard[42] = '\'';
  fullKeyboard[43] = '#';
  fullKeyboard[44] = ',';
  fullKeyboard[45] = '.';
  fullKeyboard[46] = '/';
  fullKeyboard[47] = '\\';
  fullKeyboard[48] = '\t'; //tab key
  fullKeyboard[49] = '\b'; //backspace key
  fullKeyboard[50] = '\r'; //enter or return key
  fullKeyboard[51] = 't';
  fullKeyboard[52] = 't';
  printArray(fullKeyboard[30]);
  println("here I am writing a line of text" + fullKeyboard[49] + "is this a new line?");
}



void draw() {
  if(keyPressed) {
  for (k = 0; k < 52; k++)
    if (key == fullKeyboard[k]) {
      call = new Key(key);
      call.Keys();
    }
  }
  /*if (keyPressed) {
   for (k = 0; k < 52; k++) {
   if (fullKeyboard[k] == key) {
   call[fullKeyboard[k]].Keys();
   }
   }
   } else {
   k=52;
   */
}


void keyReleased() {
  fill(255); 
  rectMode(CENTER); 
  rect(width/2, height/2, 1000, 350);
}