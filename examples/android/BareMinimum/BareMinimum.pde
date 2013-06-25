import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.android.*;

PIOIOManager ioioManager = new PIOIOManager(this);

void setup() {
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

