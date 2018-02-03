#include <IRremoteInt.h>
#include <IRremote.h>

// setting the pin constants
const int RECV_PIN = 11;
const int JOY_DIG_PIN = 10;
const int ANALOGX = 0;
const int ANALOGY = 1;

IRrecv irrecv(RECV_PIN);
decode_results results;

void setup() {
  Serial.begin(9600);
  irrecv.enableIRIn(); // start the receiver
}

void loop() {

  int xVal = analogRead(ANALOGX);
  int yVal = analogRead(ANALOGY);

  if (irrecv.decode(&results)) {
    Serial.print(xVal);
    Serial.print(",");
    Serial.print(yVal);
    Serial.print(",");
    Serial.print(results.value, HEX);
    irrecv.resume(); // receive next value
  } else {
    Serial.print(xVal);
    Serial.print(",");
    Serial.print(yVal);
    Serial.print(",");
    Serial.print("null");
  }

  Serial.println();
  delay(500);
}

