int sensorPin = A0;
int sensorValue = 0;
char val;
int val1;
int val2;
int val3;
int val4;
int val5;
int val6;
int val7; 

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ;
  }
  establishContact(); 
  
}

void loop() {  
  val1 = map(analogRead(sensorPin),0,149,0,255);

  val2 = map(analogRead(sensorPin),150,299,0,255);

  val3 = map(analogRead(sensorPin),300,449,0,255);

  val4 = map(analogRead(sensorPin),450,599,0,255);

  val5 = map(analogRead(sensorPin),600,749,0,255);

  val6 = map(analogRead(sensorPin),750,899,0,255);

  val7 = map(analogRead(sensorPin),900,1023,0,255);

  sensorValue = analogRead(sensorPin) / 4;
   Serial.write(0);
   Serial.write(sensorValue);
   delay(50);
}

void establishContact() {
  while (Serial.available() <=0) {
    Serial.println("A");
    delay(300);
  }
}



