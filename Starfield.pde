Particle[] hi;

//your code here
void setup()
{
  size(500, 500);
  hi = new Particle[100];

  for (int i=0; i<95; i++) {
    hi[i] = new Particle(250, 240);
  }
  for (int j=95; j<hi.length; j++) {
    hi[j] = new OddBallParticle(250, 240);
  }


  noStroke();
}


void draw()
{
  background(0);
  for (int i=0; i<hi.length; i++) {
    hi[i].show();
    hi[i].move();
  }
  fill(256, 150, 0);
  ellipse(400, 90, 100, 100);
  
}

class Particle
{
  int myColour;
  double myX, myY, mySpeed, myAngle;

  Particle() {
    myColour = color((int)(Math.random()*256),
      (0), (int)(Math.random()*256));
    myX = myY = 250;
    mySpeed = Math.random()*8;
    myAngle = Math.random()*2*Math.PI;
  }

  Particle(int x, int y) {
    myColour = color((int)(Math.random()*256),
      (0), (int)(Math.random()*256));
    myX = x;
    myY = y;
    mySpeed = Math.random()*8;
    myAngle = Math.random()*2*Math.PI;
  }

  void show() {
    fill(myColour);
    ellipse ((float)myX, (float)myY, 15, 15);
  }
  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) *mySpeed;
  }
}

class OddBallParticle extends Particle
{
  OddBallParticle ()
  {
    myColour = color(100, 100, 100);
    myX = myY = 250;
    mySpeed = Math.random()*8;
    myAngle = Math.random()*2*Math.PI;
  }

  OddBallParticle (int x, int y)
  {
    myColour = color(255);
    myX = x;
    myY = y;
    mySpeed = Math.random()*8;
    myAngle = Math.random()*2*Math.PI;
  }

  void show() {
    fill(myColour);
    rect ((float)myX, (float)myY, 10, 10);
  }
    void move() {
    myX = myX + Math.sin(myAngle) * mySpeed;
    myY = myY + Math.cos(myAngle) *mySpeed;
  }
}





void mousePressed() {
   for (int i=0; i<95; i++) {
    hi[i] = new Particle(mouseX, mouseY);
    
  for (int j=95; j<hi.length; j++) {
    hi[j] = new OddBallParticle(mouseX, mouseY);
  }
  }
}
