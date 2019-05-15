

int sensorPin = A0;    // select the input pin for the potentiometer
int ledPin = 9;      // select the pin for the LED with a ~ <<< TILDA
int sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin);

  analogWrite(ledPin,sensorValue / 4); // analogRead values go from 0 to 1023, analogWrite values from 0 to 255
  
  Serial.println(sensorValue/4);
}
