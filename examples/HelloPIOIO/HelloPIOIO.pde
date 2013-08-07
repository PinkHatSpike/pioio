import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

PIOIOManager ioioManager;
boolean state = false;
DigitalOutput led;

void setup() {
  size(displayWidth, displayHeight);
  rectMode(CENTER);
  stroke(0);
  fill(255, 255, 0);

  ioioManager = new PIOIOManager(this);
  ioioManager.start();
}

void draw() {
  background(0x80);
  int size = state ? 600 : 300;
  rect(width/2, height/2, size, size);
}

void mousePressed() {
  state = !state;
}

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  led = ioio.openDigitalOutput(IOIO.LED_PIN, true);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  led.write(!state); // status LED is active LOW
  try {
    Thread.sleep(20);
  }
  catch (InterruptedException e) {
  }
}

