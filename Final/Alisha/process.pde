// An array of stripes
Stripe[] stripes = new Stripe[10];

import processing.serial.*;
Serial myPort;

void setup() {
  size(480, 270);
  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  
  // Initialize all Stripe objects
  for (int i = 0; i < stripes.length; i++) {
    stripes[i] = new Stripe(10, i*(width/10));
  }
}

void draw() {
  
  background(100);
  // Move and display all Stripe objects
  for (int i = 0; i < stripes.length; i++) {
    // Check if mouse is over the Stripe
    stripes[i].rollover(mouseX);
    stripes[i].display();
  }
}


class Stripe {
  
  float x;     // horizontal location of stripe
  float w;     // width of stripe
  // A boolean variable keeps track of the object's state.
  boolean mouse; // state of each object

  Stripe(int w_, int x_) {
    w = w_;
    x = x_;
    mouse = false;
  }

  // Draw stripe
  void display() {
    
    // Boolean variable determines Stripe color.
    if (mouse) { 
      fill(66, 244, 107);
      myPort.write('b'); 
    } else {
      fill(255,100);
         myPort.write('c');
    }
    
    noStroke();
    rect(x,0,w,height);
  }

// Check to see if point if mouse is in any indiviual rectangle
  void rollover(int mx) { 
    // Left edge is x, Right edge is x + w
    if (mx > x && mx < x + w) {
      mouse = true;
    } else {
      mouse = false;
    }
  }
}
