import oscP5.*;
import netP5.*;
OscP5 oscP5; 
PrintWriter filename;

NetAddress FinalClearParam;
OscMessage finalClear = new OscMessage("/finalclear");
NetAddress ExportParam;
OscMessage exportMsg = new OscMessage("/export");

NetAddress GridGate;
NetAddress GridParam;
NetAddress GridPtParam;
NetAddress GirdCull;
NetAddress GirdCullTwo;
NetAddress GridCullThree;
NetAddress bgViewParam;
NetAddress bgRenderParam;
NetAddress CullPatQ;

OscMessage gridGate = new OscMessage("/gridGate");
OscMessage gridProp = new OscMessage("/gridparam");
OscMessage gridpt = new OscMessage("/gridptinf");
OscMessage gridCull = new OscMessage("/gridcull");
OscMessage gridCullTwo = new OscMessage("/gridcull2");
OscMessage gridCullThree = new OscMessage("/gridcull3");
OscMessage bgRender = new OscMessage("/renderimagebg");
OscMessage bgView = new OscMessage("/viewnamebg");
OscMessage cullPatQMsg = new OscMessage("/cullpat?");

void setup() {
  size(100, 100); background(0); stroke(255);
  
  filename = createWriter("filename.txt"); 
  oscP5 = new OscP5(this, 5999); setports();
  frameRate(24);
  clearall();
  exportFalse(); delay(500);
  gridgateCLOSED(); delay(500);
  renderOFF(); delay(500);

  genGrid(); delay(500);
  gridPts(); delay(500);
  girdCullPat(); delay(500);
  extraCullPattern(); delay(500);
  
  gridgateOPEN(); delay(1000*60*3);

  gridgateCLOSED(); delay(1000); background(30, 30, 140);
  
  bgViewName(); delay(500);
  exportTrue(); delay(3000);
  exportFalse(); delay(500);
  
  renderON(); delay(1000*60*90);
  renderOFF(); println ("Complete"); delay(500);
  
  clearall(); delay(500);
  exit();
}

void draw() {}

////////////////////////////////////////////////////////                
void setports() {
  FinalClearParam = new NetAddress("localhost", 4006);
  ExportParam = new NetAddress("locahost", 4007);

  GridGate = new NetAddress("localhost", 4000);
  GridParam = new NetAddress("localhost", 4001);
  GridPtParam = new NetAddress("localhost", 4002);
  GirdCull = new NetAddress("localhost", 4003);
  bgViewParam = new NetAddress("localhost", 4004);
  bgRenderParam = new NetAddress("localhost", 4005);

  GirdCullTwo = new NetAddress("localhost", 4008);
  GridCullThree = new NetAddress("localhost", 4009);
  CullPatQ = new NetAddress("localhost", 4010);
}
////////////////////////////////////////////////////////
void genGrid() {
  String gridNum = "";
  float eX = floor(random(3, 5));
  float eY = floor(random(3, 7));
  float sY = random(5, 8);
  float sX = random(3, 7);
  gridNum += sX + "," ;
  gridNum += sY + "," ;
  gridNum += eX + "," ;
  gridNum += eY ;

  gridProp.add(gridNum);
  oscP5.send(gridProp, GridParam);
  println("Grid Sent!");
  println("SizeX:" + sX + " " + "SizeY:" + sY);
  println("ExtnX:" + eX + " " + "ExtnX:" + eY);
}
void gridPts() {
  String ptinf = "";
  int s = floor(random(1, 3000));
  int rn = floor(random(5, 12));
  ptinf += s + ","; 
  ptinf += rn;
  gridpt.add(ptinf);
  oscP5.send(gridpt, GridPtParam);
  println("Point Cloud Sent:       " + ptinf);
}
void girdCullPat() {
  String cullheader = "";
  String cullheader2 = "";
  String cullheader3 = "";

  cullheader += "True,";
  for (int i = 0; i < 8; i++) {
    float cn = random(0, 1);
    if (i > 3) {  if (cn > .5) { cullheader2 += "true"; } 
      else { cullheader2 += "false"; } 
        if (i !=7) { cullheader2 += ","; }
      }
    else { if (cn > .5) { cullheader3 += "true"; }
      else { cullheader3 += "false";}
        if (i !=7 ) { cullheader3 += ","; }
      }
  }
      gridCull.add(cullheader);
      gridCullTwo.add(cullheader2);
      gridCullThree.add(cullheader3);
      oscP5.send(gridCull, GirdCull);
      oscP5.send(gridCullTwo, GirdCullTwo);
      oscP5.send(gridCullThree, GridCullThree);
      println("Cull Pattern Sent:     " + cullheader + "SEPeratED" + cullheader2 + "WELL" + cullheader3);
}
void bgViewName(){
  String vName = "v";
  int vNum  = floor(random(1,20));
  vName += vNum;
  bgView.add(vName);
  oscP5.send(bgView, bgViewParam);
  filename.print(vName);
  filename.flush();
  filename.close();
}
void extraCullPattern(){
      String var = "";
      float d = random(0,1);
      if (d >= .05) { var = "true"; }
      else { var = "false"; }
      cullPatQMsg.add(var);
      oscP5.send(cullPatQMsg, CullPatQ);
      println("Extra Cull Pattern? :  " + var);
    }   
////////////////////////////////////////////////////////
void gridgateOPEN() {
  OscMessage gridGate = new OscMessage("/gridGate");
  gridGate.add("True");
  oscP5.send(gridGate, GridGate);
  println("Gate Open!");
}
void gridgateCLOSED() {
  OscMessage gridGate = new OscMessage("/gridGate");
  gridGate.add("False");
  oscP5.send(gridGate, GridGate);
  println("Gate Closed!");
}
void renderON() {
  OscMessage bgRender = new OscMessage("/renderimagebg");
  bgRender.add("True");
  oscP5.send(bgRender, bgRenderParam);
  println("Rendering...");
}
void renderOFF() {
  OscMessage bgRender = new OscMessage("/renderimagebg");
  bgRender.add("False");
  oscP5.send(bgRender, bgRenderParam);
  println("Not Rendering...(?)");
}
void exportTrue() {
  OscMessage exportMsg = new OscMessage("/export");
  exportMsg.add("True");
  oscP5.send(exportMsg, ExportParam);
  println("Exported");
}
void exportFalse() {
  OscMessage exportMsg = new OscMessage("/export");
  exportMsg.add("False");
  oscP5.send(exportMsg, ExportParam);
  println("Export Reset");
}
 void clearall(){
  OscMessage finalClear = new OscMessage("/finalclear");
  finalClear.add("True");
  oscP5.send(finalClear, FinalClearParam);
  println("Cleared");
}