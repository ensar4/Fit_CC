#include <Wire.h>
#include <MPU6050.h>
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#include <SPI.h>

#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

#include <Arduino.h>
#include <TinyGPS++.h>
#include <SoftwareSerial.h>
TinyGPSPlus gps;
SoftwareSerial gpsSerial(D5, D6); // RX, TX
char buffer[100];

         double lat = gps.location.lat();
         double lng = gps.location.lng();
         
void printData() 
{

        double altitude = gps.altitude.meters();

        int year = gps.date.year();
        int month = gps.date.month();
        int day = gps.date.day();

        int hour = gps.time.hour();
        int minute = gps.time.minute();
        int second = gps.time.second();

        snprintf(buffer, sizeof(buffer),
                 "Latitude: %.8f, Longitude: %.8f, Altitude: %.2f m, "
                 "Date/Time: %d-%02d-%02d %02d:%02d:%02d",
                 lat, lng, altitude, year, month, day, hour, minute, second);

        Serial.println(buffer);

}

MPU6050 mpu;

int fallThreshold = 19000;  // Prilagodite vrijednost prema potrebama            //FALL----------
int isFalling = 0;
unsigned long fallStartTime = 0;
                                                                                //PULSE----------
const int sensorPin = A0;                               // A0 is the input pin for the heart rate sensor
int sensorValue;    

//#define WIFI_SSID "LIZDE" 
//#define WIFI_PASSWORD "03022005" 
//#define FIREBASE_AUTH "z3RAeP0USbkfj3r7FZRT4vROEN2BzlPJiksEatmp"
//#define FIREBASE_HOST "https://ioty-3d8de-default-rtdb.firebaseio.com/"  

#define WIFI_SSID "Hollywood_guest"
//#define WIFI_PASSWORD "12345678"
#define FIREBASE_AUTH "AIzaSyCRsZI7G7xtDbJSi5sPI9HppNPL2DTr7L4"
#define FIREBASE_HOST "https://smart-garage-52d7c-default-rtdb.europe-west1.firebasedatabase.app"

FirebaseData fbdo;


void setup() {
  Serial.begin(115200);
  gpsSerial.begin(9600);

  Wire.begin();
  mpu.initialize();

  WiFi.begin(WIFI_SSID);//, WIFI_PASSWORD
  Serial.println("Connecting to Wi-Fi...");

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting...");
  }
  Serial.println("Connected to Wi-Fi");

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

 
  mpu.setFullScaleAccelRange(2); // Postavi opseg akcelerometra na +/- 16g

  // Kalibriraj akcelerometar
  mpu.CalibrateAccel(6);
  mpu.PrintActiveOffsets();

  Serial.print("Trenutna granica: ");
  Serial.println(fallThreshold);
}

void loop() {
    while (gpsSerial.available() > 0) {
        if (gps.encode(gpsSerial.read())) {
            printData();
            //Serial.println("ddd");
           // Firebase.RTDB.setDouble(&fbdo, "bracelet/lat", lat);
           // Firebase.RTDB.setDouble(&fbdo, "bracelet/lng", lng);
        }
    }
  
  sensorValue = analogRead(sensorPin);
  
  int rawAccelX = mpu.getAccelerationX();
  int rawAccelY = mpu.getAccelerationY();
  int rawAccelZ = mpu.getAccelerationZ();

  // Izračunaj veličinu vektora ubrzanja
  int accelMagnitude = sqrt(pow(rawAccelX, 2) + pow(rawAccelY, 2) + pow(rawAccelZ, 2));

  // Provjeri da li je veličina vektora veća od granice pada
  if (accelMagnitude > fallThreshold) {
    if (!isFalling) {
      isFalling = 1;
      fallStartTime = millis();
      Serial.println("Osoba je pala");
    }
  } else {
    isFalling = 0;
    Serial.println("Osoba nije pala");
    Firebase.RTDB.setFloat(&fbdo, "bracelet/detektovanPad", 0);
    Serial.println(accelMagnitude);
  }

  // Provjeri da li je isFalling tačno i da li je prošlo 30 sekundi od pada
  if (isFalling && (millis() - fallStartTime >= 10000)) {
    // Nastavi izvršavanje koda
    Serial.println("Prošlo je 30 sekundi od pada");
    // Dodajte dodatne radnje ili logiku ovdje
      Firebase.RTDB.setFloat(&fbdo, "bracelet/detektovanPad", 1);
    // Resetuj isFalling i fallStartTime
    isFalling = 0;
    fallStartTime = 0;
  }

  Serial.println("Broj otkucaja:");
  Serial.println(sensorValue);
  Firebase.RTDB.setFloat(&fbdo, "bracelet/pulse", sensorValue);
  delay(1000);  // Prilagodite vrijeme kašnjenja prema potrebama



}
