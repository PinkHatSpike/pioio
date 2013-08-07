import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

PIOIOManager ioioManager;
PwmOutput led; 
float dutyCycle = 0.0;

void setup() {
  size(displayWidth, displayHeight);
  noStroke();

  textAlign(CENTER, CENTER);
  textSize(128);

  ioioManager = new PIOIOManager(this);
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
  // LED_PIN supports PWM on original IOIO and Droidalyzer/IOIOMint
  // on IOIO-OTG change pin and attach external LED
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

