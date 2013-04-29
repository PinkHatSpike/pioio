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
Encoder encoder;
int degrees = 0;

void setup() {
  textAlign(CENTER, CENTER);
  textSize(128);
  ellipseMode(CENTER);
  ioioManager.start();
}

void draw() {
  background(200);
  
  stroke(0);
  fill(map(abs(degrees%360), 0, 360, 0, 255));
  
  int d = degrees%360;
  if(d >= 0) {
    arc(width/2, height/2, 500, 500, PI, (float)(PI+Math.toRadians(d)), PIE);
  }
  else if(d < 0){
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
      degrees += step;
    }
  });
  encoder.start();
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  try {
    Thread.sleep(20);
  }
  catch (InterruptedException e) {
  }
}

