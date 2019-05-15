//Alejandro Colmenares

int imageIndex = 0;
PFont f;
int x = 50;
int y = 50;
int w = 100;
int h = 75;

int sState = 0;



PImage[] images = new PImage[3];

void setup() {
  size(600, 500);

  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage(i + ".jpg" );
    f = createFont ("Times New Roman", 10);
  }
}

void draw() {

  if (sState == 0) {
    scene0();
    delay(100);
  } else if (sState == 1) {
    scene1();
    delay(100);
  } else if (sState == 2) {
    scene2();
    delay(100);
  }

  fill(175);
  rect(x, y, w, h);

  //println(sState);
}






void scene0() {

  image(images[0], 0, 0, width, height);

  textFont(f, 15);
  fill(255, 0, 0);
  textSize(15);
  textAlign(LEFT, TOP);
  text("Welcome, the journey ahead is dangerous but assured. You are in this meadow with three passages, leading North, East, and South, choose wisely.", width/10, height/2, 200, 200);


  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed  && sState == 0) {
    sState = 1;
    //delay(200);
  }
}

void scene1() {

  image(images[1], 0, 0, width, height);
  textFont(f, 15);
  fill(255, 0, 0);
  textSize(15);
  textAlign(LEFT, TOP);
  text("Welcome, the journey ahead is dangerous but assured. You are in this meadow with three passages, leading North, East, and South, choose wisely.", width/10, height/2, 200, 200);

  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed  && sState == 1) {
    sState = 2;
    //delay(200);
  }
}

void scene2() {

  image(images[2], 0, 0, width, height);
  textFont(f, 15);
  fill(255, 0, 0);
  textSize(15);
  textAlign(LEFT, TOP);
  text("Welcome, the journey ahead is dangerous but assured. You are in this meadow with three passages, leading North, East, and South, choose wisely.", width/10, height/2, 200, 200);


  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed  && sState == 2) {
    sState = 0; // Have it return to building
  }
}
