//A sketch to demonstrate the tone() function

int piezoPin = 9;
int PotPin = A0; // Potentiometer
int sensorVal = 0;
int FrequencyPlay = 0;

void setup() {
  Serial.begin(9600);

}

void loop() {

  sensorVal = analogRead(PotPin);

  FrequencyPlay = map(sensorVal, 0, 1023, 2000, 5000);  //Map incoming values, 0-1023, to Frequency/tone
  // Most people can hear a freq between 2000-5000 HZ.

  tone(piezoPin, FrequencyPlay); // tone(pin, freq, time);


  Serial.println(FrequencyPlay);
}
