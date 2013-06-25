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
 changes circle color based on tact button state
 
 WIRING
 ------
 push button hooked up to 3.3v and to pin 10 of IOIO
 */

PIOIOManager ioioManager = new PIOIOManager(this);
DigitalInput pushButton;
boolean pushButtonState = false;

void setup() {
  ellipseMode(CENTER);
  background(255);
  stroke(0);
  strokeWeight(5);

  ioioManager.start();
}

void draw() {
  if (pushButtonState) {
    fill(0, 255, 0);
  }
  else {
    fill(200);
  }

  ellipse(width/2, height/2, 500, 500);
}

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  pushButton = ioio.openDigitalInput(10, DigitalInput.Spec.Mode.PULL_DOWN);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  try {
    pushButtonState = pushButton.read();
    Thread.sleep(20);
  }
  catch (InterruptedException e) {
  }
}

