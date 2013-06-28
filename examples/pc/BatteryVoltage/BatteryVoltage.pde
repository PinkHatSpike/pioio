import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

import java.text.DecimalFormat;

// displays the LIPO battery voltage
// on Droidalyzer / IOIOMint, battery voltage can be read on pin 41

float batteryVoltage = 0.0;
AnalogInput batteryIn;

PIOIOManager ioioManager = new PIOIOManager(this); 

void setup() {
  size(700, 700);
  textAlign(CENTER, CENTER);
  textSize(128);

  ioioManager.start();
}

void draw() {
  background(0);
  DecimalFormat df = new DecimalFormat("#.00");
  text("" + df.format(batteryVoltage) + "v", width/2, height/2);
}

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  batteryIn = ioio.openAnalogInput(41);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  try {
    batteryVoltage = batteryIn.getVoltage();
    Thread.sleep(100);
  }
  catch (InterruptedException e) {
  }
}

