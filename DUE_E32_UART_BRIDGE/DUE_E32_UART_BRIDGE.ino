/*
 * EBYTE E32 433T30D (TTL-1W)
 * ARDUINO DUE
 * M0         ----- D24
 * M1         ----- D26
 * TX         ----- RX2
 * RX         ----- TX2
 * AUX        ----- D22
 * VCC        ----- 5V 0.2A (more or less)
 * GND        ----- GND
 *
 */

 #define M0 24
 #define M1 26
 #define AUX 22

void setup() {
  Serial.begin(115200);
  Serial2.begin(115200);

  pinMode(M0, OUTPUT);
  pinMode(M1, OUTPUT);
  pinMode(AUX, INPUT);

  digitalWrite(M0, LOW);
  digitalWrite(M1, LOW);
}

void loop() {
  while(Serial.available()) Serial2.write(Serial.read());
  while(Serial2.available()) Serial.write(Serial2.read());
}
