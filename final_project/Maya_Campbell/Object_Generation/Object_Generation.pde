//Form Generation//
//Requires oscP5 for processing
//Requires gHowl, Kangaroo2, FabTools, Ladybug, Tsplines, Elefront for Rhino/Grasshopper
import oscP5.*;
import netP5.*;
OscP5 oscP5; 

NetAddress startParam;
NetAddress boxParam;
NetAddress cullParam;
NetAddress ptsParam;
NetAddress gateParam;
NetAddress advbParam;
NetAddress smViewParam;
NetAddress smRenderParam;
NetAddress FinalClearParam;
NetAddress ExportParam;

OscMessage geoGateMsg = new OscMessage("/start");
OscMessage BoxMsg=new OscMessage ("/BoxMsg");
OscMessage cullMsg=new OscMessage ("/cullpattern");
OscMessage internalptMsg=new OscMessage ("/internalpoints");
OscMessage advBake = new OscMessage("/bakeGate");
OscMessage smViewMsg = new OscMessage("/viewname");
OscMessage smRender = new OscMessage("/renderimagesm");
OscMessage finalClear = new OscMessage("/finalclear");
OscMessage exportMsg = new OscMessage("/export");
  
PrintWriter filename;

void setup() {  
  size(1500, 1000);
  background(0);
  filename = createWriter("filename.txt"); 
  oscP5 = new OscP5(this, 5999);

  setports();
  frameRate(24);
  clearall();
  exportFalse();
  closeGeoGate();
  smRenderOFF();
    
    delay(1000);
  
    BoxGeneration();  delay(1000);
    cullPattern();  delay(1000);
    internalPoints();  delay(1000*10);
  
    openGeoGate();  delay(1000*60);
  
    closeGeoGate();  delay(1000); background(30, 30, 140);
    smviewname(); delay(1000);
    exportTrue(); delay(3000);
    exportFalse(); delay(500);
  
    smRenderON();
    delay(1000*60*30);
    smRenderOFF();
  
    println("Complete");
    clearall();
    delay(500);
    exit();
}

void draw(){}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setports() {
  startParam = new NetAddress("localhost", 3000);
  boxParam = new NetAddress("localhost", 3001);
  cullParam = new NetAddress("localhost", 3002);
  ptsParam = new NetAddress("localhost", 3003);
  smViewParam = new NetAddress("localhost", 3004);
  smRenderParam = new NetAddress("localhost", 3005);
  FinalClearParam = new NetAddress("localhost", 3006);
  ExportParam = new NetAddress("locahost", 3007);
}
////////"Gates"//////////////////////////////////////////////////////////////////////

void openGeoGate(){
  OscMessage geoGateMsg = new OscMessage("/start");   
  geoGateMsg.add("True");
  oscP5.send(geoGateMsg, startParam);
  println("Gate Open!");
}
void closeGeoGate(){
  OscMessage geoGateMsg = new OscMessage("/start");   
  geoGateMsg.add("False");
  oscP5.send(geoGateMsg, startParam);
  println("Gate Closed!");
}
void exportTrue(){
  OscMessage exportMsg = new OscMessage("/export");
  exportMsg.add("True");
  oscP5.send(exportMsg, ExportParam);
  println("Exported");
}
void exportFalse(){
  OscMessage exportMsg = new OscMessage("/export");
  exportMsg.add("False");
  oscP5.send(exportMsg, ExportParam);
  println("Export Reset");
}
void smRenderON(){ 
  OscMessage smRender = new OscMessage("/renderimagesm");
  smRender.add("True");
  oscP5.send(smRender, smRenderParam);
  println("Rending!!");
}
void smRenderOFF(){
  OscMessage smRender = new OscMessage("/renderimagesm");
  smRender.add("False");
  oscP5.send(smRender, smRenderParam);
  println("STOPPED!!");
}
/////////////////////////////////////////////////////////////////////////////////////

void BoxGeneration(){
  float rech = random(2, 4);
  float recw = random(3, 5);
  float boxh = random(4, 6);
  String rh = str(rech);
  String rw = str(recw);
  String bh = str(boxh);
  String boxheader = ""; 
  {
    boxheader += rh + ",";
    boxheader += rw + ",";
    boxheader += bh;
  }
  BoxMsg.add(boxheader);
  oscP5.send(BoxMsg, boxParam);
  println("Box info Sent     " + boxheader);
  
}

void cullPattern(){
  String cullheader = "";
  cullheader += "True,";
  for (int i = 0; i < 3; i++){
    float cn = random(0,1);
      if (cn >= .5) { cullheader += "true";  }
      else           { cullheader += "false"; }
      if (i != 2)    { cullheader += ",";     }
  }
  cullMsg.add(cullheader);
  oscP5.send(cullMsg, cullParam); 
  println("Cull Patteren Sent:        " + cullheader);
}

void internalPoints(){  
  String pts = "";
  
  int ptc = floor(random(3, 6));
  int seed = floor(random(1, 2000));
  pts += ptc + ",";
  pts += seed;
  
  internalptMsg.add(pts);
  oscP5.send(internalptMsg, ptsParam);
  println("Internal Points Sent       " + pts );
}

void smviewname(){
  String vName = "v";
  
  int vNum = floor(random(1,30));
  vName += vNum;
  smViewMsg.add(vName);
  oscP5.send(smViewMsg, smViewParam);
  println("View Name:    "  + vName);
  filename.print(vName);
  filename.flush();
  filename.close();  
}

void clearall(){
  OscMessage finalClear = new OscMessage("/finalclear");
  finalClear.add("True");
  oscP5.send(finalClear, FinalClearParam);
  println("Cleared");
}
////////////////////////////////////////////////////////////////////////////////////////////////////
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  //printData();
  print(theOscMessage);
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
}