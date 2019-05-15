//Follow arduino example 04.communication/SerialCallResponse

import processing.serial.*; //import the Serial library

 Serial myPort;  //the Serial port object
 
  int empty;           // 0
  int backgroundColor;           // Background color            
  int[] serialInArray = new int[2];    // Where we'll put what we receive
  int serialCount = 0;                 // A count of how many bytes we receive
  boolean firstContact = false;        // Whether we've heard from the microcontroller

void setup() {
  size(200, 200); //make our canvas 200 x 200 pixels big
  //  initialize your serial port and set the baud rate to 9600
  myPort = new Serial(this, Serial.list()[4], 9600);

}

void draw() {
  background(backgroundColor,255,12);
  
}

void serialEvent(Serial myPort) {
//put the incoming data into a String - 
// read a byte from the serial port:
    int inByte = myPort.read();
    // if this is the first byte received, and it's an A, clear the serial
    // buffer and note that you've had first contact from the microcontroller.
    // Otherwise, add the incoming byte to the array:
    if (firstContact == false) {
      if (inByte == 'A') {
        myPort.clear();          // clear the serial port buffer
        firstContact = true;     // you've had first contact from the microcontroller
        myPort.write('A');       // ask for more
      }
    }
    else {
      // Add the latest byte from the serial port to array:
      serialInArray[serialCount] = inByte;
      serialCount++;

      // If we have 2 bytes:
      if (serialCount > 1 ) {
        empty = serialInArray[0];
        backgroundColor = serialInArray[1];

        // print the values (for debugging purposes only):
        println(empty + "\t" + backgroundColor);

        // Send a capital A to request new sensor readings:
        myPort.write('A');
        // Reset serialCount:
        serialCount = 0;
    }
  }
}
