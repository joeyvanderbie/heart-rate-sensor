Title:  Easy dirty Arduino - Processing heart rate sensor
Author: Joey van der Bie
Date:   September 16, 2014 

# Easy dirty Arduino - Processing heart rate sensor
The goal of this project is to have an easy to use and create heart rate sensor.
It uses the minimal hardware components and has most of the logic on the computer using a Processing patch.
This project is based on the more professional DIY heart rate sensor found on http://embedded-lab.com/blog/?p=5508
Of which a pdf copy can be found on this repository.
Sorry for al the dirty code, pictures, ect, it was a quick project which had to work within a few hours.

##Quick list
1. Buy the needed hardware: computer, Arduino, infrared sensor(TCRT1000), resistors(10kOhm, 150Ohm), wires, ect
2. Install Arduino and Processing software
3. Create the hardware setup according to schematic and hardware picture (note the arduino is missing on the picture)
![image of schematic](https://raw.githubusercontent.com/joeyvanderbie/heart-rate-sensor/master/Schematic.jpg "Schematic")
![image of hardware](https://raw.githubusercontent.com/joeyvanderbie/heart-rate-sensor/master/Prototype.jpg "Prototype")
4. connect the sensor to the Arduino, the Arduino to the computer
5. Upload the Arduino code as found in this repository
6. Start the processing patch and pray that everything works!

##Possible improvements
* The processing patch only uses a simple low-pass filter and detects beats with a simple threshold, 
a more advanced algorithm could be created which detects beats based on a Gaussian.
* The current patch only keeps your beats for a few second until the array is full. This can be easily modified to have a continuous array of x items.
* Many more...this was a quick and dirty project, so there is much room for improvement!
