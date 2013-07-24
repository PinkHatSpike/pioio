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

Device                                                                                    | Android ADB              | Android Bluetooth | Android OpenAccessory (ADK) | PC USB | PC Bluetooth
------------------------------------------------------------------------------------------|:------------------------:|:-----------------:|:---------------------------:|:------:|:-----------:
[IOIO](https://www.sparkfun.com/products/10585)                                           | Yes (Android OS < 4.2.2) | Yes               | Yes                         | N/A    | Yes
[Droidalyzer](http://droidalyzer.com) / [IOIO Mint](http://www.adafruit.com/products/885) | Yes (Android OS < 4.2.2) | Yes               | Yes                         | N/A    | Yes 
[IOIO-OTG](https://www.sparkfun.com/products/11343)                                       | Yes (Android OS < 4.2.2) | Yes               | Yes                         | Yes    | Yes
(thanks Jordan of SFE for the IOIO-OTG board!)

See [IOIO Over OpenAccessory](https://github.com/ytai/ioio/wiki/IOIO-Over-OpenAccessory) for more info on IOIO's Accessory support.
Also, check out the [Android Accessory Tool](https://github.com/PinkHatSpike/AndroidAccessoryTool) to easily add Android OpenAccessory support to your sketch.

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
1. Instantiate and start a PIOIOManager in your sketch's setup function: <code>new PIOIOManager(this).start();</code>
2. define functions <code>void ioioSetup(IOIO ioio)</code> and <code>void ioioLoop(IOIO ioio)</code> in your main sketch.
3. (Android Mode): Don't forget to enable Internet (for USB ADB connections) and/or Bluetooth (for bluetooth dongle connections) Android permissions in your sketch.  

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

    void setup() {
      size(displayWidth, displayHeight);
      new PIOIOManager(this).start();
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
pioio is licensed under [LGPL 3.0](http://www.gnu.org/licenses/lgpl-3.0.html)

<pre>
/*
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation, version 3.0.
  (http://www.gnu.org/licenses/lgpl-3.0.html)

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
  
  Contributors:
      PinkHatSpike - spike@pinkhatproductions.com
*/
</pre>

pioio is built on top of [Processing](https://github.com/processing/processing), [Processing for Android](https://github.com/processing/processing-android), [IOIOLib](https://github.com/ytai/ioio/wiki), [JNA](https://github.com/twall/jna), and [PureJavaComm](http://www.sparetimelabs.com/purejavacomm/purejavacomm.php), each of which carries its own license and terms.