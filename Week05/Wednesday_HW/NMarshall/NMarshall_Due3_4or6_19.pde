//NMarshall
//I'm a bit lost when it comes to this topic
//So, nothing impressive going on here
//But it at least works :) 
 
circle myBall; // ClassName ObjectName
circle myBall2; // ClassName ObjectName
circle myBall3; // ClassName ObjectName
float phi;

void setup() {
  size(600, 600);
  // Initialize Objects
myBall = new circle(1, 1, 1, 1); // Object is equal to Construct funtion
myBall2 = new circle(1.2,random(1,2),0.2,1.2);
myBall3 = new circle(random(1,2),2.5,3.5,1.5);
}

void draw() {
  background(255);
    translate(300,300);
    rotate(phi);
  myBall.move(); 
  myBall.display();
  myBall2.move(); 
  myBall2.display();  
  myBall3.move(); 
  myBall3.display();
}

// Define a class outside of setup and draw.
class circle { 
  // Variables.
float harmX;
float harmY;
float harm ;
float harm2;


  // Constructor.
  circle(float Inx,float Iny,float Inh,float In2) 
  { 
  harmX=Inx;
  harmY=Iny;
  harm =Inh;
  harm2=In2;
  }
    
  // Function
  void display() { 
    stroke(0);
    fill(random(100,255),random(100,255),random(100,255),100);
    ellipse(harmX, harmY, 30, 30);
  }

  // Function?
  void move() { 

 harmX = 200*cos(harm);   
 harmY = 5*sin(harm2);
  
  harm = 0.10 + harm;
  harm2 = 0.0003 + harm2;
  
  phi = 0.08+ phi;
   }
}
