package com.pinkhatproductions.pioio;

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
}
