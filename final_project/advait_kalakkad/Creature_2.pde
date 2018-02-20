class Creature2 {

  Shell s;
  Tentacle t1;
  Tentacle t2;
  Tentacle t3;
  Tentacle t4;


  int maxspeed;
  int maxforce;

  Creature2(float x, float y, float z) {
    s = new Shell(x, y);
    t1 = new Tentacle(x-15, y+24, z);
    t2 = new Tentacle(x-5, y+24, z);
    t3 = new Tentacle(x+5, y+24, z);
    t4 = new Tentacle(x+15, y+24, z);

    maxspeed = 20;
    maxforce = 5;

    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(s.body, t1.segments.get(0).body, t1.segments.get(0).body.getWorldCenter());
    //rjd1.localAnchorB.set(0,1);
    box2d.world.createJoint(rjd1);

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(s.body, t2.segments.get(0).body, t2.segments.get(0).body.getWorldCenter());
    //rjd1.localAnchorB.set(0,1);
    box2d.world.createJoint(rjd2);

    RevoluteJointDef rjd3 = new RevoluteJointDef();
    rjd3.initialize(s.body, t3.segments.get(0).body, t3.segments.get(0).body.getWorldCenter());
    //rjd1.localAnchorB.set(0,1);
    box2d.world.createJoint(rjd3);

    RevoluteJointDef rjd4 = new RevoluteJointDef();
    rjd4.initialize(s.body, t4.segments.get(0).body, t4.segments.get(0).body.getWorldCenter());
    //rjd1.localAnchorB.set(0,1);
    box2d.world.createJoint(rjd4);
  }

  void update(Vec2 target) {
    Vec2 loc = s.body.getWorldCenter();
    Vec2 desired = target.sub(loc);  // A vector pointing from the position to the target

    // If the magnitude of desired equals 0, skip out of here
    // (We could optimize this to check if x and y are 0 to avoid mag() square root


    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mulLocal(maxspeed);
    // Steering = Desired minus Velocity

    Vec2 vel = s.body.getLinearVelocity();
    Vec2 steer = desired.sub(vel);

    float len = steer.length();
    if (len > maxforce) {
      steer.normalize();
      steer.mulLocal(maxforce);
      
    }
    
  }

  void display() {
    s.display();
    t1.display();
    t2.display();
    t3.display();
    t4.display();
  }
}

class Shell {
 
  Body body; 
  float w;
  float h;
  float r;
  
  Vec2 pos;
  Vec2 vel;
  Vec2 acc;
  
  int maxspeed;
  int maxforce;
  
  Shell(float x, float y) {
    
    w = random(24,36);
    h = 48;
    r = 25;
    
    maxspeed = 20;
    maxforce = 10;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    body.setGravityScale(0);
    
    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld(r);
    Vec2 offset = new Vec2(0,-h/2);
    offset = box2d.vectorPixelsToWorld(offset);
    circle.m_p.set(offset.x,offset.y);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    body.createFixture(ps,1.0);
    body.createFixture(circle,1.0);
    
    pos = box2d.getBodyPixelCoord(body);
    vel = new Vec2(0,0);
    acc = new Vec2(0,-.05);
   
    body.setLinearVelocity(new Vec2(random(-1,1),random(-1,1)));
  }
  
  
  
  void display() {
    
   Vec2 pos = box2d.getBodyPixelCoord(body);
   float a = body.getAngle();
   
   rectMode(CENTER);
   pushMatrix();
   translate(pos.x,pos.y);
   rotate(-a);
   noFill();
   strokeWeight(.75);
   stroke(255);
   
   rect(0,0,w,h);
   ellipse(0,-h/2,r*2,r*2);
   popMatrix();
    
  }
  
 
}


class Tentacle {
  
  ArrayList<Segment> segments;
  
  Tentacle(float x, float y, float z) {
  
    segments = new ArrayList();
  
    for(int i = 0; i < z; i++) {
      Segment s = new Segment(x,y + i*20);
      
      segments.add(s);
      
      if(i>0) {
        
        Segment previous = segments.get(i-1);
        
        DistanceJointDef djd = new DistanceJointDef();
        djd.bodyA = previous.body;
        djd.bodyB = s.body;
        
        djd.length = 1;
        djd.frequencyHz = 6;
        djd.dampingRatio = 9;
        
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
        
      }
    }
  
  }
  
  
  void display() {
    for(Segment t : segments) {
      t.display();
  
    }
  }
}

class Segment {

  Body body;
  float w;
  float h;

  Segment(float x, float y) {

    w = 6;
    h = 12;


    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
    body.setGravityScale(0);

    PolygonShape ps = new PolygonShape();
    
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 1;
    fd.friction = .3;
    fd.restitution = 1;
    
    body.createFixture(fd);
    
  }
  
  void display() {
   
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    noFill();
    stroke(255);
    strokeWeight(.75);
    rect(0,0,w,h,3);
    popMatrix();
    
  }
}