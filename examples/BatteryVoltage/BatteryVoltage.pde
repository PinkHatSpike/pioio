import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

import java.text.DecimalFormat;

// displays the LIPO battery voltage
// on Droidalyzer / IOIOMint, battery voltage can be read on pin 41

float batteryVoltage = 0.0;
AnalogInput batteryIn;

void setup() {
  size(displayWidth, displayHeight);
  textAlign(CENTER, CENTER);
  textSize(128);

  new PIOIOManager(this).start();
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

