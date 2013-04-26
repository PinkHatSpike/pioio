pioio
=====

IOIO Library for Processing

the aim of this library is to make using the IOIO development board in Processing's Android mode simple, cutting down as much boilerplate code as possible.

inspiration from 
* [How to use Processing in Android mode with the IOIO board](http://benatwork.cc/how-to-use-processing-in-android-mode-with-the-ioio-board/)

and of course
* [IOIO](https://github.com/ytai/ioio/wiki)
* [Processing](http://processing.org/)

currently built on top of
* IOIOLib v3.26 (App-IOIO0326)
* Processing 2.0b8

tested on a [Droidalyzer](http://droidalyzer.com/) in ADB over USB cable and over a Bluetooth Dongle

How to use
----------
1. Instantiate a PIOIOManager: <code>PIOIOManager ioioManager = new PIOIOManager(this);</code>
2. start it: <code> ioioManager.start();</code>
3. define functions <code>void ioioSetup(IOIO ioio)</code> and <code>void ioioLoop(IOIO ioio)</code> in your main sketch.
4. Don't forget to enable Internet (for USB ADB connections) and/or Bluetooth (for bluetooth dongle connections) Android permissions in your sketch.  

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
