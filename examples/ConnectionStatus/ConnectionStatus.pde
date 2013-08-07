import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

// for connection to pc host
static {
  // leave commented out to auto-discover serial port (SLOW!)  
  //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
}

PIOIOManager manager;
String connectionType;
boolean connected;
boolean incompatible;

void setup() {
  size(displayWidth, displayHeight);
  
  manager = new PIOIOManager(this);
  manager.start();
}

void draw() {
  background(0);
  
  textAlign(LEFT, TOP);
  textSize(16);
  String status = "";
  if(!connected) {
    status = "not connected";
  }
  else if(incompatible) {
    status = "not compatible";
  }
  else if(connectionType == null) {
    status = "??";
  }
  else {
    status = "connected via:\n" + connectionType;
  }
  text(status, 10, 10);
}

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  connected = true;
  connectionType = manager.connectionType(ioio);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  try {
    Thread.sleep(100);
  }
  catch (InterruptedException e) {
  }
}

void ioioDisconnected(IOIO ioio) {
  connected = false;
  println("disconnected.");
}

void ioioIncompatible(IOIO ioio) {
  incompatible = true;
  println("incompatible.");
}
