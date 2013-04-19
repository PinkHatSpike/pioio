package com.pinkhatproductions.pioio;

import ioio.lib.util.IOIOLooper;
import ioio.lib.util.BaseIOIOLooper;
import ioio.lib.util.IOIOLooperProvider;

public class PIOIOLooper extends BaseIOIOLooper implements IOIOLooperProvider {
    private static final String TAG = "PIOIOLooper";
        
    /**
    * IOIOLooperProvider stuff
    */
    @Override
    public IOIOLooper createIOIOLooper(String connectionType, Object extra) {
        return this.createIOIOLooper();
    }

    protected IOIOLooper createIOIOLooper() {
        throw new RuntimeException("OVERRIDEME!!");
    }
}