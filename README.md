pioio
=====

IOIO Library for Processing

the aim of this library is to make using the IOIO development board in Processing's Android mode as simple as possible, cutting down as much boilerplate code as possible.

inspiration from  
[How to use Processing in Android mode with the IOIO board](http://benatwork.cc/how-to-use-processing-in-android-mode-with-the-ioio-board/)

and of course  
[IOIO](https://github.com/ytai/ioio/wiki)  
[Processing](http://processing.org/)  

Example: IOIOBlink.pde
----------------------
<code>
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
    boolean state = false;

    void ioioSetup(IOIO ioio) throws ConnectionLostException {
      led = ioio.openDigitalOutput(IOIO.LED_PIN, true);
    }

    void ioioLoop(IOIO ioio) throws ConnectionLostException {
        led.write(state);
        state = !state;
        try {
          Thread.sleep(1000);
        }
        catch (InterruptedException e) {

        }
    }
</code>

FOR THE FUTURE:
---------------
add support for using the IOIO connected to a PC (either via IOIO-OTG or Bluetooth)