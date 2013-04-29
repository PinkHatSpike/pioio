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

