// Rayneil Hall Week 1 Hw#2

int SunSizeOriginaL=15;
float move=1.5;
float rotate=1;
float growth=0.5;

void setup() {
  size (700,700);
}

void draw() {
  background (171,234,236);
}


//Movement
Fill(210,204,13);
circle (400,600, + move, SunSize, SunSize); // The circle will move the page
circle (400,600,50*cos(move), 400 + 100*sin(move), 2, 2);  Animates the sun
circle (400 + rotate*cos(move/2), 400 + orbit*sin(move/2), 2, 2);

//Growth
noFill();
circle(400,600, 50 + growth); // This circle will appear larger over time
//circle (400,600,SunSizeOriginal + growth, PlanetSizeOriginal + growth); with a variable
// circle 400,400,0 + growth-2); Reducing growth with subtraction

// Reassign a new value to "move" and "growth" at the end of each draw loop cycle 
move= move+1.5;
roate= rotate+1;
growth= growth+0.5;

//SunSize= Sunsize *2;

//'println prints value to the console
