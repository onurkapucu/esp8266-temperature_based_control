# esp8266-temperature_based_control
Time and temperature based control of my heaters. 

I get temperature readings(via DHT22 sensor attached to esp8266) from several locations of my home. I upload them to Mathworks' thingspeak platform. 

This code get's the latest temperature reading from a certain sensor with a http get request. Then it puls time information and runs a decision logic whether to turn on the heater relay or not.
