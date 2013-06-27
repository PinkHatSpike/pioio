import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.pc.*;

static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

PIOIOManager ioioManager = new PIOIOManager(this);

void setup() {
  size(700, 700);
  ioioManager.start();
}

void draw() {
}

private DigitalOutput led;

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  led = ioio.openDigitalOutput(IOIO.LED_PIN, true);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  led.write(false); // status LED is active LOW
  try {
    Thread.sleep(1000);
  }
  catch (InterruptedException e) {
  }

  led.write(true);
  try {
    Thread.sleep(1000);
  }
  catch (InterruptedException e) {
  }
}

