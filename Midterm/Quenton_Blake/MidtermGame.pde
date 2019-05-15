int x,y,w,h,speedX,speedY;
int paddleXL,paddleYL,paddleW,paddleH,paddleS;
boolean upL,downL;

int paddleXR,paddleYR;
boolean upR,downR;

color colorL = color(0,255,0);
color colorR = color(255,255,0);

int scoreL = 0;
int scoreR = 0;
int winScore = 10;

void setup() {
  size(500,500);
  x = width/2;
  y = height/2;
  w = 50;
  h = 50;
  speedX = 2;
  speedY = 3;
  
  textSize(30);
  textAlign(CENTER);
  rectMode(CENTER);
  paddleXL = 30;
  paddleYL = height/2;
  paddleW = 30;
  paddleH = 100;
  paddleS = 5;
  
  paddleXR = width-40;
  paddleYR = height/2;
  paddleW = 30;
  paddleH = 100;
}

void draw()  {
  background(0);
  drawCircle();
  moveCircle();
  
  drawPaddles();
  movePaddle();
  restrictPaddle();
  contactPaddle();
  
  scores();
  gameOver();
}

void movePaddle(){
 if(upL) {
   paddleYL = paddleYL - paddleS;
 }
 if(downL) {
  paddleYL = paddleYL + paddleS; 
 }
 if(upR) {
   paddleYR = paddleYR - paddleS;
 }
 if(downR) {
  paddleYR = paddleYR + paddleS; 
 }
}

void drawPaddles() {
 fill(colorL);
 rect(paddleXL, paddleYL, paddleW, paddleH);
 fill(colorR);
 rect(paddleXR, paddleYR, paddleW, paddleH);
}

void restrictPaddle(){
 if(paddleYL - paddleH/2 < 0) {
   paddleYL = paddleYL + paddleS;
 }
 if(paddleYL + paddleH/2 > height) {
   paddleYL = paddleYL - paddleS;
 }
 if(paddleYR - paddleH/2 < 0) {
   paddleYR = paddleYR + paddleS;
 }
 if(paddleYR + paddleH/2 > height) {
   paddleYR = paddleYR - paddleS;
 }
 
}

void contactPaddle(){
  if (x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2) {
    if(speedX < 0) {
    speedX = -speedX;
    }
  }
  
else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2) {
        if(speedX > 0) {
          speedX = -speedX;
        }
  }
}

void drawCircle(){
  fill(255,0,0);
  ellipse(x, y, w, h);
}



void moveCircle(){
  if ( x > width - w/2) {
    setup();
    speedX = -speedX;
    scoreL = scoreL + 1;
  }
  else if( x < 0 + w/2) {
    speedX = -speedX;
    setup();
    scoreR = scoreR + 1;
  }
   if ( y > height - h/2) {
    speedY = -speedY;
    
  }
  else if( y < 0 + h/2) {
    speedY = -speedY;
    
  }
  x = x+ speedX;
  y = y+ speedY;
}


void keyPressed() {
  if(key == 'w' || key == 'W'){
   upL = true; 
  }
   if(key == 's' || key == 'S'){
    downL = true; 
   }
   if(keyCode == UP){
   upR = true; 
  }
   if(keyCode == DOWN){
    downR = true; 
   }
}

void keyReleased() {
   if(key == 'w' || key == 'W'){
     upL = false;
   }
    if(key == 's' || key == 'S'){
      downL = false;
    }
      if(keyCode == UP){
       upR = false; 
  }
   if(keyCode == DOWN){
    downR = false; 
   }  
}

void scores() {
  fill(255);
  text(scoreL, 100, 50);
  text(scoreR, width-100, 50);
}

void gameOver() {
  if(scoreL == winScore) {
    gameOverPage(" Green Wins!", colorL);
  }
  
  if(scoreR == winScore) {
    gameOverPage(" Yellow Wins!", colorR);
  } 
}

void gameOverPage(String text, color c) {
  
  speedX = 0;
  speedY = 0;
  
  text("Game over",width/2, height/3 - 40);
  text("Click to play again", width/2, height/3 + 40);
  fill(c);
  text(text,width/2, height/3);
  if(mousePressed) {
    scoreR = 0;
    scoreL = 0;
    speedX = 3;
    speedY = 3;
  }
}
