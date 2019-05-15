
// An array of 100 Ball objects!
Ball[] balls = new Ball[100]; 

void setup() {
  size(480, 270);
  // Initialize each ball using a for loop.
  for (int i = 0; i < balls.length; i ++ ) { 
    balls[i] = new Ball(color(i*2), width/2, i*3, i/20.0);
  }
}

void draw() {
  background(255);
  // Run each ball using a for loop.  
  for (int i = 0; i < balls.length; i++) { 
    //balls[i].move();
    balls[i].display();
  }
}

// define a new class


class Ball { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  //Constructor
  Ball(color c_, float xpos_, float ypos_, float xspeed_) {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
  }


  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(c);
    ellipse(xpos,ypos,10,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
