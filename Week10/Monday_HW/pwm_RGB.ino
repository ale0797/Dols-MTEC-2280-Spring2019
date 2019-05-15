
int sensorPin0 = A0;    // select the input pin for the potentiometer
int ledPin0 = 9;      // select the pin for the LED with a ~ <<< TILDA
int sensorValue0 = 0;  // variable to store the value coming from the sensor

int sensorPin1 = A1;    
int ledPin1 = 10;      
int sensorValue1 = 0;  

int sensorPin2 = A2;   
int ledPin2 = 11;      
int sensorValue2 = 0;  

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin0, OUTPUT);
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue0 = analogRead(sensorPin0);
  sensorValue1 = analogRead(sensorPin1);
  sensorValue2 = analogRead(sensorPin2);

  analogWrite(ledPin0,sensorValue0 / 4); // analogRead values go from 0 to 1023, analogWrite values from 0 to 255
  analogWrite(ledPin1,sensorValue1 / 4); 
  analogWrite(ledPin2,sensorValue2 / 4); 
  
  Serial.println(sensorValue1/4);
}
