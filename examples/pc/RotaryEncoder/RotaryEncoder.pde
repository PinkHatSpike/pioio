import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.pc.*;

static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

/**
 * adjust a counter with a rotary (quadrature) encoder
 * (mine is an old computer mouse's scroll wheel, HOORAY FREE!)
 * 
 * WIRING
 * ------
 * common - GND
 * A - pin 3
 * B - pin 4
 */

PIOIOManager ioioManager = new PIOIOManager(this);
Encoder encoder;
int count = 0;

void setup() {
  size(700, 700);
  textAlign(CENTER, CENTER);
  textSize(128);
  ellipseMode(CENTER);
  ioioManager.start();
}

void draw() {
  background(200);

  stroke(0);
  fill(map(abs(count%360), 0, 360, 0, 255));

  // on this particular encoder, each 'cick' == 2 counts
  // adjust so it's 1 degree per click
  int degrees = count/2;

  int d = degrees%360;
  if (d >= 0) {
    arc(width/2, height/2, 500, 500, PI, (float)(PI+Math.toRadians(d)), PIE);
  }
  else if (d < 0) {
    arc(width/2, height/2, 500, 500, (float)(PI+Math.toRadians(d)), PI, PIE);
  }

  stroke(0);
  fill(255);

  text("" + degrees, width/2, height/2);
}

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  encoder = new Encoder(ioio, 3, 4);
  encoder.setListener(new EncoderListener() {
    public void onTick(int step) {
      count += step;
    }
  }
  );
  encoder.start();
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  try {
    Thread.sleep(20);
  }
  catch (InterruptedException e) {
  }
}

