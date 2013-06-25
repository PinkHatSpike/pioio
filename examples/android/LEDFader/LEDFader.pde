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
PwmOutput led; 
float dutyCycle = 0.0;

void setup() {
  noStroke();

  textAlign(CENTER, CENTER);
  textSize(128);

  ioioManager.start();
}

void draw() {
  fill(dutyCycle*255, dutyCycle*255, 0);
  rect(0, 0, width, height);

  fill(255);
  text("Touch Me", width/2, height/2);
}

void mousePressed() {
  dutyCycle = constrain(mouseX / (float)width, 0.0, 1.0);
}

void mouseDragged() {
  mousePressed();
}

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  led = ioio.openPwmOutput(IOIO.LED_PIN, 1000);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  led.setDutyCycle(1.0 - dutyCycle); // status LED is active low, hence the "1.0 -" 

  try {
    Thread.sleep(20);
  }
  catch(InterruptedException e) {
  }
}

