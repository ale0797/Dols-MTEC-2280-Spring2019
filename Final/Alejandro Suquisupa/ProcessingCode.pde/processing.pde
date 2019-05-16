import processing.serial.*;
Serial myPort;
int backgroundColor;
int[] serialInArray =new int[2];
int serialCount = 0;
boolean firstContact = false;
int empty;


void setup() {
  size(500, 500);
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  
  if (backgroundColor <= 36) { 
    background(204, 4, 4);
    println("red");
  }

  if (backgroundColor >= 37 && backgroundColor <= 72) {
    background(247, 156, 0);
    println("orange");
  }
  
  if (backgroundColor >= 73 && backgroundColor <= 108) {
    background(224, 232, 13);
    println("yellow");
  }
  
  if (backgroundColor >=109 && backgroundColor <= 144) {
    background(37, 135, 5);
    println("green");
  }
  if (backgroundColor >= 145 && backgroundColor <= 180) {
    background(8, 216, 192);
    println("blue");
  }
  if (backgroundColor >= 181 && backgroundColor <= 216) {
    background(98, 6, 160);
    println("purple");
  }
  if (backgroundColor >= 217 && backgroundColor < 255) {
    background(234, 21, 113);
    println("pink");
  }
}

void serialEvent(Serial myPort) {
  int inByte = myPort.read();
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();
      firstContact = true;
      myPort.write('A');
    }
  } else {
    serialInArray[serialCount] = inByte;
    serialCount++;

    if (serialCount > 1) {
      empty = serialInArray[0];
      backgroundColor = serialInArray[1];

      println(empty + "\t" + backgroundColor);
      myPort.write('A');
      serialCount = 0;
    }
  }
}

