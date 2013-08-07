import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

/**
 changes the background color based on potentiometer input
 
 WIRING
 ------
 left pot pin to ground
 right pot pin to 3.3v
 center pot pin to IOIO pin 39 
 */

PIOIOManager ioioManager;
AnalogInput potentiometer;
float potValue = 0.0;

void setup() {
  size(displayWidth, displayHeight);
  
  ioioManager = new PIOIOManager(this);
  ioioManager.start();
}

void draw() {
  float mappedPotValue = map(potValue, 0.0, 1.0, 0, 255);
  background(mappedPotValue);
}

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  potentiometer = ioio.openAnalogInput(39);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  try {
    potValue = potentiometer.read();
    Thread.sleep(20);
  }
  catch (InterruptedException e) {
  }
}

