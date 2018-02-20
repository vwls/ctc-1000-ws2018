class Creature {

  //BodySeg p1;
  //BodySeg p2;
  //BodySeg p3;
  //BodySeg p4;
  //BodySeg p5;
  ArrayList<BodySeg> segments;

  DistanceJointDef djd;
  DistanceJoint dj;
  float m;

  Creature(float x, float y, float z) {

    m = 0;
    //x = width/2;
    //y = height/2;
    //p1 = new BodySeg(x,y);
    //p2 = new BodySeg(x,y+30);
    //p3 = new BodySeg(x,y+60);
    //p4 = new BodySeg(x,y+90);
    //p5 = new BodySeg(x,y+120);

    segments = new ArrayList();

    for (int i = 0; i < z; i ++) {
      BodySeg bs = new BodySeg(x, y);

      segments.add(bs);

      if (i == 0) {
        BodySeg head = segments.get(0);
        head.v.fd.density = 1000;
      } else if (i > 0) {
        djd = new DistanceJointDef();

        BodySeg previous = segments.get(i-1);
        previous.v.fd.density = 0;

        djd.bodyA = previous.v.body;
        djd.bodyB = bs.v.body;

        djd.length = 1;
        djd.frequencyHz = 2;
        djd.dampingRatio  = 10;

        dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void update() {

    dj.setLength(15*sin(m)+5);

    println(dj.getLength());

    m = m + .075;
  }


  void display() {
    for (BodySeg b : segments) {
      b.display();
      Vec2 pos = box2d.getBodyPixelCoord(b.v.body);
      fill(255);
      noStroke();
      ellipse(pos.x, pos.y, 5, 5);
    }

    BodySeg p1 = segments.get(0);
    BodySeg p2 = segments.get(1);
    BodySeg p3 = segments.get(2);
    BodySeg p4 = segments.get(3);
    BodySeg p5 = segments.get(4);

    Vec2 pos1 = box2d.getBodyPixelCoord(p1.v.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(p2.v.body);
    Vec2 pos3 = box2d.getBodyPixelCoord(p3.v.body);
    Vec2 pos4 = box2d.getBodyPixelCoord(p4.v.body);
    Vec2 pos5 = box2d.getBodyPixelCoord(p5.v.body);

    stroke(255, 50);
    strokeWeight(10);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    line(pos2.x, pos2.y, pos3.x, pos3.y);
    line(pos3.x, pos3.y, pos4.x, pos4.y);
    line(pos4.x, pos4.y, pos5.x, pos5.y);
  }
}

class BodySeg {

  Vertebrae v;
  Flipper f1;
  Flipper f2;

  float m;
  RevoluteJointDef rjd1;
  RevoluteJointDef rjd2;

  BodySeg(float x, float y) {

    m = PI;

    v = new Vertebrae(x, y);
    f1 = new Flipper(x+20, y);
    f2 = new Flipper(x-20, y);

    rjd1 = new RevoluteJointDef();
    rjd1.initialize(v.body, f1.body, f1.body.getWorldCenter());
    rjd1.localAnchorB.set(-1, 0);
    //rjd1.referenceAngle = (5*PI)/6;
    rjd1.motorSpeed = -m*3;
    rjd1.maxMotorTorque = 100.0;
    //rjd1.enableLimit = true;
    //rjd1.lowerAngle = (5*PI)/6;
    //rjd1.upperAngle = (7*PI)/6;

    rjd1.enableMotor = false;
    box2d.world.createJoint(rjd1);

    rjd2 = new RevoluteJointDef();
    rjd2.initialize(v.body, f2.body, f2.body.getWorldCenter());
    rjd2.localAnchorB.set(1, 0);
    //rjd2.referenceAngle = PI/6;
    rjd2.motorSpeed = m*3;
    rjd2.maxMotorTorque = 100;
    //rjd2.enableLimit = true;
    //rjd2.lowerAngle = PI/6;
    //rjd2.upperAngle = (11*PI)/6;

    rjd2.enableMotor = false;
    box2d.world.createJoint(rjd2);
  }

  void display() {
    v.display(); 
    f1.display();
    f2.display();
  }
}

class Flipper { 

  float w;
  float h;

  Body body;

  Flipper(float x, float y) {

    w = 24;
    h = 3;

    BodyDef bd  = new BodyDef();

    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
    body.setGravityScale(0);

    PolygonShape ps = new PolygonShape();

    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);

    ps.setAsBox(box2dW, box2dH);

    FixtureDef td = new FixtureDef();
    td.shape = ps;

    td.density = 6;
    td.friction = 10;
    td.restitution = 0.1;

    body.createFixture(td);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body); 
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    noFill();
    stroke(255);
    strokeWeight(.75);
    rect(0, 0, w, h);
    popMatrix();
  }
}

class Vertebrae {

  Body body;
  float w; 
  float h;

  float box2dW;
  float box2dH;

  FixtureDef fd;

  Vertebrae(float a, float b) {
    w = 36;
    h = 12;

    BodyDef bd = new BodyDef();

    bd.position = box2d.coordPixelsToWorld(a, b);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
    body.setGravityScale(0);

    PolygonShape ps = new PolygonShape();

    box2dW = box2d.scalarPixelsToWorld(w/2);
    box2dH = box2d.scalarPixelsToWorld(h/2);

    ps.setAsBox(box2dW, box2dH);

    fd = new FixtureDef();
    fd.shape = ps;

    fd.density = 1;
    fd.friction = 5;
    fd.restitution = .5;

    body.createFixture(fd);
  }

  void display() {

    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);

    noFill();
    stroke(255);
    strokeWeight(.5);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}