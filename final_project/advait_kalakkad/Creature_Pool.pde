import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Creature> slipper;
ArrayList<Creature2> tenty;

void setup() {
  size(800,600,P2D);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  slipper = new ArrayList<Creature>();
  tenty = new ArrayList<Creature2>();
  
  for(int i = 0; i < 9; i ++) {
  slipper.add(new Creature(random(width),random(height), 5));
  tenty.add(new Creature2(random(width),random(height),floor(random(5,10))));
    
  }
  
}


void draw() {
  box2d.step();
  background(38, 106, 242);
  
  for(Creature2 t : tenty) {
   t.display(); 
    
  }
  
  for(Creature s : slipper) {
   s.display();
   s.update();
    
  }
  
}