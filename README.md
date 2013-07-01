pioio
=====

IOIO Library for Processing

The aim of this library is to make using the IOIO development board in Processing simple, cutting down as much boilerplate code as possible. Works in both Java mode (desktop sketches) and Android mode.

inspiration from 
* [How to use Processing in Android mode with the IOIO board](http://benatwork.cc/how-to-use-processing-in-android-mode-with-the-ioio-board/)

and of course
* [IOIO](https://github.com/ytai/ioio/wiki)
* [Processing](http://processing.org/)

currently built on top of
* IOIOLib v3.30 (App-IOIO0330)
* Processing 2.0

tested on
* [Droidalyzer](http://droidalyzer.com/) in ADB (USB,Bluetooth Dongle)
* [IOIO-OTG](https://www.sparkfun.com/products/11343) in ADB (USB,Bluetooth Dongle) and to a PC (USB, Bluetooth Dongle) (thank you Jordan of SFE for the board!)

How to use
----------
1. Instantiate a PIOIOManager: <code>PIOIOManager ioioManager = new PIOIOManager(this);</code>
2. start it: <code> ioioManager.start();</code>
3. define functions <code>void ioioSetup(IOIO ioio)</code> and <code>void ioioLoop(IOIO ioio)</code> in your main sketch.
4. (Android Mode): Don't forget to enable Internet (for USB ADB connections) and/or Bluetooth (for bluetooth dongle connections) Android permissions in your sketch.  

Example: IOIOBlink.pde
----------------------
<code>
    
    import ioio.lib.api.*;
    import ioio.lib.api.exception.*;
    import com.pinkhatproductions.pioio.*;

    // for connection to pc host
    static {
      // leave commented out to auto-discover serial port (SLOW!)  
      //System.setProperty("ioio.SerialPorts", "/dev/tty.usbmodem1411");
    }

    PIOIOManager ioioManager = new PIOIOManager(this);

    void setup() {
      size(displayWidth, displayHeight);
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

</code>

