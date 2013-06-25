import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.pc.*;

static {
  System.setProperty("ioio.SerialPorts", "/dev/tty.IOIOBFEB-IOIO-App");
}
boolean state = false;
DigitalOutput led;

PIOIOManager ioioManager = new PIOIOManager(this);

void setup() {
  size(700, 700);
  rectMode(CENTER);
  stroke(0);
  fill(255, 255, 0);

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

