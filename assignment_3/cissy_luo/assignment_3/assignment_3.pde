
import processing.sound.*;


system cosmos;
SinOsc sine;
TriOsc tri;
Pulse pulse;


void setup() {



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

  sine.freq(map(sin(mouseY), 0, 1, 700, 800));

  cosmos.run();

  saveFrame("A5/plantt_##########.png");
}