pioio
=====

IOIO Library for Processing

The aim of this library is to make using the [IOIO hardware development board](https://github.com/ytai/ioio/wiki) in [Processing](http://processing.org/) simple, cutting down as much boilerplate code as possible. 
Works in both Java mode (desktop sketches) and [Android mode](http://wiki.processing.org/w/Android).

inspiration from 
* [How to use Processing in Android mode with the IOIO board](http://benatwork.cc/how-to-use-processing-in-android-mode-with-the-ioio-board/)

and of course
* [IOIO](https://github.com/ytai/ioio/wiki)
* [Processing](http://processing.org/)

currently built on top of
* IOIOLib v3.30 (App-IOIO0330)
* Processing 2.0

tested devices and modes

Device                                                                                    | Android ADB              | Android Bluetooth | Android OpenAccessory | PC USB | PC Bluetooth
------------------------------------------------------------------------------------------|:------------------------:|:-----------------:|:---------------------:|:------:|:-----------:
[IOIO](https://www.sparkfun.com/products/10585)                                           | Yes (Android OS < 4.2.2) | Yes               | Not Tested            | N/A    | Yes
[Droidalyzer](http://droidalyzer.com) / [IOIO Mint](http://www.adafruit.com/products/885) | Yes (Android OS < 4.2.2) | Yes               | Not Tested            | N/A    | Yes 
[IOIO-OTG](https://www.sparkfun.com/products/11343)                                       | Yes (Android OS < 4.2.2) | Yes               | Not Tested            | Yes    | Yes
(thanks Jordan of SFE for the IOIO-OTG board!)

A note about the "Android OS < 4.2.2" thing: [Secure USB Debugging](http://nelenkov.blogspot.com/2013/02/secure-usb-debugging-in-android-422.html) has been introduced in 4.2.2.
What this means is any host that wants to connect to an Android device will have to go through an RSA key-exchange dance to do so.
The IOIO firmware does not (yet?) support RSA keys. To do so would mean some coding effort and compiling the IOIO firmware with libcrypto (which has its own export rules problems).
For now, ADB on OS 4.2.2 is a no-go.

Install
-------
1. Download the [latest master zip](https://github.com/PinkHatSpike/pioio/archive/master.zip).
2. Rename downloaded zip file to pioio.zip, and unzip it.
3. Copy folder to your sketchbook's library folder (see [How to Install a Contributed Library](http://wiki.processing.org/w/How_to_Install_a_Contributed_Library))

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

License
-------
LGPL 
<code>

/*
 * (C) Copyright 2012 Nuxeo SA (http://nuxeo.com/) and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * Contributors:
 *     PinkHatSpike - spike@pinkhatproductions.com
 */

</code>