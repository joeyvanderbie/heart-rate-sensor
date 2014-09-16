/*
  ReadAnalogVoltage
  Reads an analog input on pin 0, converts it to voltage, and prints the result to the serial monitor.
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.
 
 This example code is in the public domain.
 */
  int ledPin = 13;
  int sensorValue = 0;
// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  pinMode (ledPin, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  digitalWrite(ledPin, HIGH);
  // read the input on analog pin 0:
  sensorValue = analogRead(A0);
  // print out the value you read:
  Serial.println(sensorValue);
  delay(50);
    digitalWrite(ledPin, LOW);
  // read the input on analog pin 0:
  //sensorValue = analogRead(A0);
  // print out the value you read:
  //Serial.println(sensorValue);
  delay(50);
}
