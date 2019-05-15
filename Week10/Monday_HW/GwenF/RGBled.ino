int sensorPin = A0;    // select the input pin for the potentiometer
//int ledPin = 9;
// select the pin for the LED with a ~ <<< TILDA

int rPin = 2;
int gPin = 4;
int bPin = 7;
float rSensing = 0;
float gSensing = 0;
float bSensing = 0;

int sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(rPin, OUTPUT);
  pinMode(gPin, OUTPUT);
  pinMode(bPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue = map(analogRead(sensorPin),0,1023,0,255);
  
//  rSensing = sensorValue / 8;
//  gSensing = sensorValue / 4;
//  bSensing = sensorValue / 2;
//  
//  analogWrite(rPin,rSensing); // analogRead values go from 0 to 1023, analogWrite values from 0 to 255
//  analogWrite(gPin,gSensing);
//  analogWrite(bPin,bSensing);
  
  if(sensorValue >= 0 && sensorValue <= 85)
  {
    digitalWrite(bPin,HIGH);
    digitalWrite(gPin,LOW);
    digitalWrite(rPin,LOW);
  }
  else if(sensorValue >= 86 && sensorValue <= 170)
  {
    digitalWrite(bPin,LOW);
    digitalWrite(gPin,HIGH);
    digitalWrite(rPin,LOW);
  }
  else if(sensorValue >= 171 && sensorValue <= 255)
  {
    digitalWrite(bPin,LOW);
    digitalWrite(gPin,LOW);
    digitalWrite(rPin,HIGH);
  }
}
