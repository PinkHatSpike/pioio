import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

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

void ioioSetup(IOIO ioio) throws ConnectionLostException {
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  try {
    Thread.sleep(20);
  }
  catch (InterruptedException e) {
  }
}

