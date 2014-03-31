// Access to the Arduino Libraries
#include <Arduino.h>

/*
  Turns on an LED on for one second, then off for one second, repeatedly.
*/


// Define the pin where the led is connected
#define     LED_PIN     13
#define     DELAY_MS    1000


int main()
{
    // Initialize Arduino Librairies
    init();

    // Set the led pin as output
    pinMode(LED_PIN, OUTPUT);

    while (1)
    {
        // Set the LED on
        digitalWrite(LED_PIN, HIGH);
        // Wait for a second
        delay(DELAY_MS);
        // Set the LED off
        digitalWrite(LED_PIN, LOW);
        // Wait for a second
        delay(DELAY_MS);
    }

}
