package com.pinkhatproductions.pioio.android;

import com.pinkhatproductions.pioio.PIOIOLooperProvider;
import ioio.lib.util.android.IOIOAndroidApplicationHelper;
import ioio.lib.util.IOIOLooperProvider;
import ioio.lib.android.bluetooth.*;
import ioio.lib.android.accessory.*;

import processing.core.PApplet;

public class PIOIOManager extends IOIOAndroidApplicationHelper {
    private static final String TAG = "PIOIOManager";
    
    public PIOIOManager(PApplet wrapper, IOIOLooperProvider provider) {
        super(wrapper, provider);
    }
    
    public PIOIOManager(PApplet applet) {
        this(applet, new PIOIOLooperProvider(applet));
    }
}
