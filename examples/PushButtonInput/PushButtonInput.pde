import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

/**
 changes circle color based on tact button state
 
 WIRING
 ------
 push button hooked up to 3.3v and to pin 10 of IOIO
 */

PIOIOManager ioioManager;
DigitalInput pushButton;
boolean pushButtonState = false;

void setup() {
  size(displayWidth, displayHeight);
  ellipseMode(CENTER);
  background(255);
  stroke(0);
  strokeWeight(5);

  ioioManager = new PIOIOManager(this);
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

