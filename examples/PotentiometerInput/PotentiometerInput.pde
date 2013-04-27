import ioio.lib.spi.*;
import ioio.lib.api.*;
import ioio.lib.accessory.*;
import ioio.lib.util.*;
import ioio.lib.util.android.*;
import ioio.lib.*;
import ioio.lib.android.bluetooth.*;
import ioio.lib.impl.*;
import ioio.lib.android.accessory.*;
import ioio.lib.bluetooth.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

/**
  changes the background color based on potentiometer input
  
  WIRING
  ------
  left pot pin to ground
  right pot pin to 3.3v
  center pot pin to IOIO pin 39 
 */

PIOIOManager ioioManager = new PIOIOManager(this);
AnalogInput potentiometer;
float potValue = 0.0;

void setup() {
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
