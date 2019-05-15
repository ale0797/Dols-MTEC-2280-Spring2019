//KEON DEPRADINE
//https://processing.org/examples/bounce.html
//http://processing.flosscience.com/processing-for-android/macul-2012/simple-game-code
//RULES: CLICK BALL TO MAKE IT GO FASTER AND GAIN POINTS. P TO PAUSE.
boolean paused = false;
int rad = 30;
float xPos,ypos;                      //Position of the ball
                      
float xspeed=1;    
float yspeed=1;    
int xDir=1;                    //left or right
int yDir=1;                    //top to bottom
float score=0;                   // score
int lives=7;                   //Number of lives you start with
boolean lost=false;            //Have you lost yet?

void setup()                 
{
  size (640,360);
  smooth();
 ellipseMode(RADIUS);
 
 xPos = width/2;                //Centers our ball
 ypos = height/2;    
 
              
  textSize(13);                //Sets the size of our text
}

void draw()                                      
{
  background (105);                               
   fill(random(255),random(255),random(255));   
  ellipse(xPos,ypos,rad,rad);               
 
  xPos= xPos + (xspeed * xDir);                        //update the ball's position 

 ypos=  ypos + (yspeed * yDir);     
  
  
  if (xPos > width - rad || xPos < rad) {    //Did the ball hit the side?
  background (random(255),random(255),random(255)); 
 xDir *= -1;  
  
}
  
  if (ypos > height - rad || ypos<rad){
 background (random(255),random(255),random(255)); 
    yDir *= -1;  
  
   }

  fill(0,255,0);    
  text("Score = "+score,10,10);                 
  text("Lives = "+lives,width-80,10);            
  if (lives<=0)                                 
  {
    textSize(20);
    text("Click to Restart", 125,100);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
  }
}

void mousePressed()                            
{
  if (dist(mouseX, mouseY, xPos, ypos)<=30)      //Did we hit the target?
  {
    score=score+yspeed;                           //Increase the speed
    yspeed=yspeed+2;                               //Increase the Score
  score=score+xspeed;
 xspeed=xspeed+2; 
}
  else                                           //We missed
  {
    if (yspeed<1 || xspeed<1)                                 //If speed is greater than 1 decrease the speed
   
    {
  
      yspeed=yspeed-1;
    xspeed=xspeed-1;
  }
   
    lives=lives-1;                               //Take away one life
 
}
  if (lost==true)                                //If we lost the game, reset now and start over 
  {
   
   yspeed=1;                                     //Reset all variables to initial conditions
      xspeed=1; 
    lives=5;
    score=0;
    xPos=width/2;
   ypos=height/2;
    xDir=1;
    yDir=1;
    lost=false;
    loop();                                     //Begin looping draw function again
  }
}

public void keyPressed() {
 fill(random(255),random(255),random(255)); 
  if ( key == 'p' ) {

    paused = !paused;

    if (paused) {
     text("Press P To Unpause", 125,100); 
      noLoop();
    } else {
      loop();
    }
  }
}
