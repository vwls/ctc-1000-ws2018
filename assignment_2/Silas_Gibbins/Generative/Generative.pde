/***************************************
*********Silas Gibbins. CTC*************
*******WS 2018. Assignment-2.***********
*******Follows from Harvard.pde.********
**********Simple generation*************
**********by click. Manual**************
*********carry-over of word*************
**********from dictionary.**************
***************************************/


/***************************************************************************************************************************
 *Initial motto, in this case for Harvard it's Veritas. I researched the logo font as well, to be as authentic as possible.*
 ***************************************************************************************************************************/
String word = "VERITAS";

// load font library
// The font must be located in the sketch's 
// "data" directory to load successfully
PFont Garamond;


/*************************************************
 *Setup just initialises a few font/image states.*
 *************************************************/
void setup() {
  size(800, 800);
  background(0);
  PImage img;
  img = loadImage("harvard.png");
  imageMode (CENTER);
  image(img, width/2, width/2, width/2, width/2);
  Garamond = createFont("Garamond", 32);
  textFont(Garamond);
} 


/********************************************************************************************************************************************************************
 *Draw then parses the String word and draws individual Chars at a point. It then changes the word (based on manual entry) and therefore the Chars on a mouse click.*
 ********************************************************************************************************************************************************************/
void draw() {
    char c1 = word.charAt(0);
    char c2 = word.charAt(1);
    char c3 = word.charAt(2);
    char c4 = word.charAt(3);
    char c5 = word.charAt(4);
    char c6 = word.charAt(5);
    char c7 = word.charAt(6);
    fill(0);
    textSize(38);
    text(c1, 312, 335);
    text(c2, 343, 335);
    text(c3, 426, 335);
    text(c4, 463, 335);
    text(c5, 362, 445);
    text(c6, 386, 445);
    text(c7, 412, 445);
  if (mousePressed) {
    clear();
    PImage img;
    img = loadImage("harvard.png");
    imageMode (CENTER);
    image(img, width/2, width/2, width/2, width/2);
    word = "ADESURI";
    // adesuri (to be very hungry), clatrat (fit with bars or railings), rassism (racism?), domigen (), conprim (forcibly together)
    // ax ave curvitat, eo fus apsistit, aq    , as
    if(word.length() < 7){
      print("enter a longer word");
      exit();
  }
  }
}