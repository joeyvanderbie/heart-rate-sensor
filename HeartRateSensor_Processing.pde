 
 // Graphing sketch
 
 
 // This program takes ASCII-encoded strings
 // from the serial port at 9600 baud and graphs them. It expects values in the
 // range 0 to 1023, followed by a newline, or newline and carriage return
 
 // Created 20 Apr 2005
 // Updated 18 Jan 2008
 // by Tom Igoe
 // This example code is in the public domain.
 
 // Update 11 june 2014
 // by Joey van der Bie
 // added lowpass filter and better threshold detection
 
 import processing.serial.*;
 
 Serial myPort;        // The serial port
 int xPos = 1;         // horizontal position of the graph
 int lineWidth = 5;
 PFont font;
 long currentTime;
 long previousTime;
 long second = 1000;
 int count = 0;
 float average = 800;
 int beatsPerMinute = 0;
 long currentMinute;
 long resetValue = 20000;
 float alpha = 0.99;
 
 
 void setup () {
 // set the window size:
   size(400, 300);        
   // List all the available serial ports
   println(Serial.list());
   // I know that the first port in the serial list on my mac
   // is always my  Arduino, so I open Serial.list()[0].
   // Open whatever port is the one you're using.
   myPort = new Serial(this, Serial.list()[5], 9600);
   // don't generate a serialEvent() unless you get a newline character:
   myPort.bufferUntil('\n');
   // set inital background:
   background(0);
   
   font = createFont(PFont.list()[2],32);
   textFont(font);
   currentTime = System.currentTimeMillis();
   currentMinute = System.currentTimeMillis();
 }
 
 void draw () {
 // everything happens in the serialEvent()
 }
 
 void writeText(String textToWrite){
  fill(255);
  text(textToWrite, width/20, height/2);   
 }
 
 void serialEvent (Serial myPort) {
   // get the ASCII string:
   String inString = myPort.readStringUntil('\n');
   
   writeText("Sensor Reading: " + inString);
   
   if (inString != null) {
     
   currentTime = System.currentTimeMillis();
   if(currentTime - previousTime >= second){
     previousTime = currentTime;
     count = 0;
   }else{
     count++;
   }
   println("Nr of samples in second: "+count);
     

     
     // trim off any whitespace:
     inString = trim(inString);
     println(inString);
     // convert to an int and map to the screen height:
     float inByte = float(inString);
     
         
     if(average < 0.93*((inByte * alpha) + ( 1.0 - alpha) * average)){
       beatsPerMinute++;
     }
     
     //lowpass
     //output_value = rate * input_value + (1.0 - rate) * previous_output_value;
      average = (inByte * alpha) + ( 1.0 - alpha) * average;
     
 
     
     //highpass
     //y[i] := α * y[i-1] + α * (x[i] - x[i-1])
     //average = alpha * average + alpha * (inByte - average);
     println("average: "+average);
     
//     if(inByte > (average-50)){
//       beatsPerMinute++;
//     }
     
     println("Beats per minute: "+ (beatsPerMinute * (60000/(float) (currentTime - currentMinute)))/2);
    
     if(currentTime - currentMinute >= resetValue){
       currentMinute = currentTime;
       beatsPerMinute = 0;
     }
    
     
     //inByte = map(inByte, 0, 1023, 0, height);
     inByte = map(average, 0, 1023, 0, height);
     
     // draw the line:
     stroke(127,34,255);
     strokeWeight(lineWidth);
     line(xPos*lineWidth, height, xPos*lineWidth, height - inByte);
   
     // at the edge of the screen, go back to the beginning:
     if (xPos*lineWidth >= width) {
       xPos = 0;
       background(0);
     }
     else {
       // increment the horizontal position:
       xPos++;
     }
   }
 }
 
 
