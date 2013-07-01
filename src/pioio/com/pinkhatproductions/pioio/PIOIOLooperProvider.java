package com.pinkhatproductions.pioio;

import ioio.lib.util.IOIOLooper;
import ioio.lib.util.IOIOLooperProvider;

import processing.core.PApplet;

public class PIOIOLooperProvider implements IOIOLooperProvider {
    private static final String TAG = "PIOIOLooperProvider";
    
    PApplet _applet;
    
    public PIOIOLooperProvider(PApplet applet) {
        _applet = applet;
    }
    /**
    * IOIOLooperProvider stuff
    */
    @Override
    public IOIOLooper createIOIOLooper(String connectionType, Object extra) {
        return this.createIOIOLooper();
    }

    protected IOIOLooper createIOIOLooper() {
        return new PIOIOLooper(_applet);
    }
}