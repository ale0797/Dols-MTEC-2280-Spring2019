#include <Servo.h>

Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards


int pos = 0;    // variable to store the servo position
int PotPin = A0; // Potentiometer
int sensorVal = 0;
int servoDegree = 0;

void setup() {
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
  // Servos are analog: Make sure to use analog out pins "~" or PWM
  Serial.begin(9600);
}

void loop() {

  sensorVal = analogRead(PotPin);

  servoDegree = map(sensorVal, 0, 1023, 0, 180);  //Map incoming values, 0-1023, to degrees

  myservo.write(servoDegree);   // tell servo to go to position of the potentiometer knob

  Serial.println(servoDegree);
  
}
