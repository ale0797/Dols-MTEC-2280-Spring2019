//Follow arduino example 04.communication/SerialCallResponse

char val; // Data received from the serial port
int ledPin = 13; // Set the pin to digital I/O 13
boolean ledState = LOW; //to toggle our LED

int sensorPin = A0; //Potentiometer Pin
int sensorValue = 0; //Potentiometer Value

void setup()
{
  pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
  //initialize serial communications at a 9600 baud rate
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  establishContact();  // send a byte to establish contact until receiver responds
}


void loop()
{
  sensorValue = analogRead(sensorPin) / 4; // map analog 0-1023 to 0-255

  //Serial.println("Hello, world!"); //send back a hello world
  Serial.write(0);  // you can write multiple sensors to processing
  Serial.write(sensorValue); // send the value of one potentiometer
  delay(50);
  
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("A");   // send a capital A
    delay(300);
  }
}

