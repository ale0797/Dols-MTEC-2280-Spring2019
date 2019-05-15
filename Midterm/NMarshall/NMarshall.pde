//Naomi Marshall
//Maze game (Final version will hopefully be more complex, I just need it to work fully first before I add more)
//Mostly good prototype just can't figure out how to pause
//I'd hopefully make it so that when mouse pressed, the ellipse stays where it last was


boolean button = false; //
int counter = 100; //"Health bar"
int ell = 25;
int oell = 20;
float g = 200;
float h = 190;
int paused = 1;
boolean win = false;

maze wall1; // Maze wall
maze wall2; // Maze wall
maze wall3; // Maze wall
maze wall4; // Maze wall
maze wall5; // Maze wall
maze wall6; // Maze wall

void setup(){
  
  size(300, 300);
  // Initialize Objects
wall1 = new maze(0, 30, 250, 30); // 
wall2 = new maze(40, 90, 260, 30);
wall3 = new maze(40, 120, 40, 140);
wall4 = new maze(80, 210, 180, 50);
wall5 = new maze(220, 160, 40, 60);
wall6 = new maze(120, 160, 110, 10);

}

void draw() {
  background(255-2*(counter));
  ellipse(mouseX,mouseY,ell,ell);
  ellipse(g,h,oell,oell);
  wall1.display();
  wall1.touchy();
  wall2.display();
  wall2.touchy();
  wall3.display();
  wall3.touchy();
  wall4.display();
  wall4.touchy();
  wall5.display();
  wall5.touchy();
  wall6.display();
  wall6.touchy();
 
  print (" ", mouseX,",",mouseY," ");

 
 if (mouseX > 190 && mouseX < 210 && mouseY > 180 && mouseY < 200) {
      
  // counter = 100;
   
   win = true;
      
 // button =false;
      
   
   fill(0,255,0); 
   rect(0, 0, 300, 300);
   
      print("Level Complete!"); 
      background(0,255,0);
      
      //textFont(f, 16);
  fill(255); 
  textSize(50);
  textAlign(CENTER, CENTER);
  text("YOU WIN :D", width/2, height/2);
    }
}

//Pause Ability (Not Completed)
  void mousePressed() {
  paused = paused+1; 
  if (paused%2==0) { 

  println ("Paused");
  

}
  
 else   { println ("Unpaused");} 
  }


  
  
  class maze { 
  // Variables, determines wall x,y,width and height
int x;
float y;
int w;
int h;
 // Constructor.
  maze(int Inx,float Iny,int Inw,int Inh) //Same as above
  { 
x = Inx;
y = Iny;
w = Inw;
h = Inh;
  }

  //Fuction shows walls
 void display() {
   if (win == false){
    stroke(1);
    fill(175); 
    rect(x, y, w, h);
   } else if (win == true)
   {  
     fill(0,255,0); 
   rect(0, 0, 300, 300);
   
      print("Level Complete!"); 
      background(0,255,0);
      
      //textFont(f, 16);
  fill(255); 
  textSize(50);
  textAlign(CENTER, CENTER);
  text("YOU WIN :D", width/2, height/2);
}
  }
  //Takes walls out (Currently not working)
  // void nodisplay() { 
  //  noStroke();
  //  noFill(); 
  //  rect(x, y, w, h);
  //}
  
  //If touching walls health goes down, If depleted, game over
 void touchy(){
 if (win == false){
 if (mouseX+(12.5) > x && mouseX-(12.5) < x+w && mouseY+(12.5) > y && mouseY-(12.5) < y+h) {
  button = true;
    counter = counter-1;
    background(255-2*(counter)); 
    
    
    
     if (counter <= 0){  // reset your counter
   counter = 0;
   print("GAME OVER"); 
   background(255,0,0);
   ell= 0;
   fill(255,0,0); 
   rect(0, 0, 300, 300);
   
  
     }
 
  } else {
   button = false;
    
    if (counter <= 0){  // reset your counter
   counter = 0;
   print(" GAME OVER "); 
   background(255,0,0);
   ell= 0;
   fill(255,0,0); 
   rect(0, 0, 300, 300);
   
     }
    else if (win == true){
    fill(0,255,0); 
   
    }
  }
  
 }
  //print(button);
  //print(counter);
   //if (button) {
  //  background(255);
  //  stroke(0);
  //} else {
  //  background(0);
  //  stroke(255);
  //}
 }
 
 }
