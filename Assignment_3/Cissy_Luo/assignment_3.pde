
import processing.sound.*;
//import ddf.minim.*;
//Minim minim;
//AudioInput in;
//AudioRecorder recorder;



system cosmos;
SinOsc sine;
TriOsc tri;
Pulse pulse;


void setup() {

//minim = new Minim(this);

  size(1000, 1000);
  background(0);
  sine = new SinOsc(this);
  sine.play();
  tri = new TriOsc(this);
  tri.play();
  pulse = new Pulse(this);
  pulse.play();
  cosmos = new system();
   
}


void draw() {

 sine.freq(map(sin(mouseY), 0, 1,700, 800));
 
  cosmos.run();

  saveFrame("A5/plantt_##########.png");

}


//void keyReleased(){
//  if (key == 'r'){
//    if (recorder.isRecording()){
//      recorder.endRecord();}
//      else{
    
//        recorder.beginRecord();
//      }
//  }
//  if (key == 's')
//  {recorder.save();}
//}