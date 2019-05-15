

int sensorPin1 = A0;    // select the input pin for the potentiometer
int sensorPin2 = A1;
int sensorPin3 = A2;
int sensorValue1 = 0;
int sensorValue2 = 0;
int sensorValue3 = 0;

int ledPin = 9; 
int ledPinR = 10;
int ledPinG = 11;
int ledPinB = 12;

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);
  pinMode(ledPinR, OUTPUT);
  pinMode(ledPinG, OUTPUT);
  pinMode(ledPinB, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue1 = analogRead(sensorPin1);
  sensorValue2 = analogRead(sensorPin2);
  sensorValue3 = analogRead(sensorPin3);

  //analogWrite(ledPin,sensorValue / 4); // analogRead values go from 0 to 1023, analogWrite values from 0 to 255
  analogWrite(ledPinR,sensorValue1 / 4);
  analogWrite(ledPinB,sensorValue2 / 4);
  analogWrite(ledPinG,sensorValue3 / 4);

  Serial.println(sensorValue2/4);
}
