import processing.serial.*;

Serial myPort;
int val;
int xPos = 1; 
float inByte = 0;


void setup () { 

  size (600, 600);
  
  println (Serial.list());
  myPort = new Serial (this, "COM3", 9600);
  background (0);
  
}

void draw () {
  
  stroke (80, 20, 180);
  line (xPos, height, xPos, height - inByte);
  
  
  if (0 < myPort.available()) {
    val = myPort.read();
  }
 
  
  if (xPos >= width) {
    
    xPos = 0;
    background (0);
   
  } else {
   
  xPos++;
  
  }
}

void serialEvent (Serial myPort){
  
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
  //trim whitespace
  inString = trim(inString);
  //convert into a map (height)
  inByte = float (inString);
  println (inByte);
  inByte = map (inByte, 0, 1023, 0, height);
  
  }
}
