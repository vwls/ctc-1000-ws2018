/***************************************
*********Silas Gibbins. CTC*************
**********WS 2018. Assignment***********
**********2. This was the first*********
***********step on the path to**********
*********creating a generative**********
***********logo, it responds************
*********to simple char(acter)**********
*********replacement on the*************
*******Harvard logo visually.***********
***************************************/

PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully



/**************************************************************************************
 *This is where you can replace the individual character in Harvard's logo (manually).*
 **************************************************************************************/

String v = "D";
String e = "U";
String r = "M";
String i = "B";
String t = "A";
String a = "S";
String s = "S";

/***************************************************************************************************************
 *Setup draws the PNG of the blank logo and draws the appropriate character in the correct place on the screen.*
 ***************************************************************************************************************/
void setup() {
  size(800, 800);
  background(0);
  PImage img;
  img = loadImage("harvard.png");
  imageMode (CENTER);
  image(img, width/2, width/2, width/2, width/2);
  fill(0);
  textSize(40);
  text(v, 312, 340);
  text(e, 345, 340);
  text(r, 430, 340);
  text(i, 463, 340);
  text(t, 362, 450);
  text(a, 386, 450);
  text(s, 406, 450);
} 

/********************************
 *Just a test for going forward.*
 ********************************/
void draw(){
  if(mousePressed){
    println(v + e);
  } else {
    println(r + i);
  }
    
}