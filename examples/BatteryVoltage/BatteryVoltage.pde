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

import java.text.DecimalFormat;

// displays the LIPO battery voltage
// on Droidalyzer / IOIOMint, battery voltage can be read on pin 41

float batteryVoltage = 0.0;
AnalogInput batteryIn;

PIOIOManager ioioManager = new PIOIOManager(this); 

void setup(){
  textAlign(CENTER, CENTER);
  textSize(128);
  
  ioioManager.start();
}

void draw() {
  background(0);
  DecimalFormat df = new DecimalFormat("#.00");
  text("" + df.format(batteryVoltage) + "v", displayWidth/2, displayHeight/2);
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
