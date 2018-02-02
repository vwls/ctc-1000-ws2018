int sqsize = 600;
int sqoff = 50;
int toffX = 0;
int toffY = 0;
int off= 48;
PFont font;


void setup(){
  size(1500,1000,P3D);
    font = loadFont("OpenSans-Light-48.vlw");
     textFont(font);
     
  background(0);
  stroke(255);
  noFill();
  
  rectMode(CENTER);
  rect(width/2,height/2,sqsize+sqoff,sqsize+sqoff);

}

  
void draw(){
    rectMode(CENTER);
  rect(width/2,height/2,sqsize+sqoff,sqsize+sqoff);
    String Letter = "X";
    int R = floor(random(1,26));
  
    if (R == 1) {  Letter = "E"; }
    if (R == 2) {  Letter = "T"; }
    if (R == 3) {  Letter = "A"; }
    if (R == 4) {  Letter = "O"; }
    if (R == 5) {  Letter = "I"; }
    if (R == 6) {  Letter = "N"; }
    if (R == 7) {  Letter = "S"; }
    if (R == 8) {  Letter = "H"; }
    if (R == 9) {  Letter = "R"; }
    if (R == 10){  Letter = "D"; }
    if (R == 11){  Letter = "L"; }
    if (R == 12){  Letter = "C"; }
    if (R == 13){  Letter = "U"; }
    if (R == 14){  Letter = "M"; }
    if (R == 15){  Letter = "W"; }
    if (R == 16){  Letter = "F"; }
    if (R == 17){  Letter = "G"; }
    if (R == 18){  Letter = "Y"; }
    if (R == 19){  Letter = "P"; }
    if (R == 20){  Letter = "B"; }
    if (R == 21){  Letter = "V"; }
    if (R == 22){  Letter = "K"; }
    if (R == 23){  Letter = "J"; }
    if (R == 24){  Letter = "Q"; }
    if (R == 25){  Letter = "X"; }
    if (R == 26){  Letter = "Z"; }
    print(Letter);
  text(Letter, 443+toffX, 227+toffY);
  toffX += off;
  if (toffX >= 624) { toffY+= off; toffX = 0;}
  if (toffY >= 624 ) { save("export.png"); 
    println("saved");
    exit();}
}