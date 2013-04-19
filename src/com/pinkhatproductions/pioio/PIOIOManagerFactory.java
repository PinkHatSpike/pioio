package com.pinkhatproductions.pioio;

import processing.core.PApplet;

public class PIOIOManagerFactory {
    private static final String TAG = "PIOIOManagerFactory";
    
    public static PIOIOManager manager(PApplet applet) {
        return new PIOIOManager(applet, new PIOIOLooperReflection(applet));
    }
}