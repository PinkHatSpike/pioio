package com.pinkhatproductions.pioio;

import ioio.lib.util.android.IOIOAndroidApplicationHelper;
import ioio.lib.util.IOIOLooperProvider;
import ioio.lib.android.bluetooth.*;
import ioio.lib.android.accessory.*;

import processing.core.PApplet;

public class PIOIOManager extends IOIOAndroidApplicationHelper {
    private static final String TAG = "PIOIOManager";
    
    protected PIOIOManager(PApplet wrapper, IOIOLooperProvider provider) {
        super(wrapper, provider);
    }
    
    public static PIOIOManager newManager(PApplet applet) {
        return new PIOIOManager(applet, new PIOIOLooperProvider(applet));
    }
}
