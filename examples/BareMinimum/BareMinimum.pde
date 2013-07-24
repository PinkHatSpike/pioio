import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

void setup() {
  new PIOIOManager(this).start();
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

