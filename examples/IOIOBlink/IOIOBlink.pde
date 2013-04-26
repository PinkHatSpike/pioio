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
