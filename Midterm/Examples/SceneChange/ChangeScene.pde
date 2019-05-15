int x = width/2;
int y = height/2;
int w = 200;
int h = 75;
PFont font;  
PImage img1;
PImage img2;
PImage img3;
String imageName;
int imgCounter = 0;

void setup() {
  size(600, 400);

  // Images must be in the "data" directory
  img1 = loadImage("img1.png");
  img2 = loadImage("img2.png");
  img3 = loadImage("img3.png");
  //font = createFont("Ariel", 40);
}

void draw() {

  //image(img, 0, 0);
  image(img1, 0, 0, width, height);

  //Button!
  if (mouseX > width/2-w/2 && mouseX < width/2+w/2 && mouseY > height/2-h/2 && mouseY < height/2+h/2 && mousePressed) {
    ++imgCounter;
    delay(500);
  }

  if (imgCounter == 0) {
    image(img1, 0, 0, width, height);
  } 
   if (imgCounter == 1) {
    image(img2, 0, 0, width, height);
  } 
   if (imgCounter == 2) {
    image(img3, 0, 0, width, height);
  } 
     if (imgCounter == 3) {
    imgCounter = 0;
    delay(1000);
  } 
  
