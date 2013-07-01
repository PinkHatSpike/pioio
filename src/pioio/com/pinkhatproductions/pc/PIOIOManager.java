package com.pinkhatproductions.pioio;

import com.pinkhatproductions.pioio.PIOIOLooperProvider;
import ioio.lib.util.pc.IOIOPcApplicationHelper;
import ioio.lib.util.IOIOLooperProvider;
import ioio.lib.pc.*;
import processing.core.PApplet;

public class PIOIOManager extends IOIOPcApplicationHelper {
    private static final String TAG = "PIOIOManagerPc";
    
    public PIOIOManager(IOIOLooperProvider provider) {
        super(provider);
    }
    
    // for compatibility
    public PIOIOManager(PApplet wrapper, IOIOLooperProvider provider) {
        super(provider);
    }
    
    public PIOIOManager(PApplet applet) {
        this(applet, new PIOIOLooperProvider(applet));
    }
}
