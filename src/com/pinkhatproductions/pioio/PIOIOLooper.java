package com.pinkhatproductions.pioio;

import java.lang.reflect.*;
import ioio.lib.api.IOIO;
import ioio.lib.util.IOIOLooper;
import ioio.lib.util.BaseIOIOLooper;
import ioio.lib.api.exception.ConnectionLostException;

import processing.core.PApplet;

import android.util.Log;

public class PIOIOLooper extends BaseIOIOLooper {
    private static final String TAG = "PIOIOLooper";
    
    PApplet _applet;
    Method _ioioSetup;
    Method _ioioLoop;

    public PIOIOLooper(PApplet applet) {
        super();
        
        _applet = applet;

        try {
            Class[] cArg = new Class[1];
            cArg[0] = IOIO.class;
            _ioioSetup = _applet.getClass().getMethod("ioioSetup", cArg);
            _ioioLoop = _applet.getClass().getMethod("ioioLoop", cArg);
        }
        catch(NoSuchMethodException e) {
            Log.e(TAG, "NoSuchMethodException: " + e);
        }
        catch(NullPointerException e) {
            Log.e(TAG, "NullPointerException: " + e);
        }
        catch(SecurityException e) {
            Log.e(TAG, "NullPointerException: " + e);
        } 
    }

    @Override
    protected void setup() throws ConnectionLostException {
        try {
            _ioioSetup.invoke(_applet, ioio_);
        }
        catch (IllegalArgumentException e) {
            Log.e(TAG, "setup: IllegalArgumentException: " + e);
        }
        catch (IllegalAccessException e) {
            Log.e(TAG, "setup: IllegalAccessException: " + e);
        }
        catch (InvocationTargetException e) {
            Log.e(TAG, "setup: InvocationTargetException: " + e);
        }
    }

    @Override
    public void loop() throws ConnectionLostException {
        try {
            _ioioLoop.invoke(_applet, ioio_);
        }
        catch (IllegalArgumentException e) {
            Log.e(TAG, "loop: IllegalArgumentException: " + e);
        }
        catch (IllegalAccessException e) {
            Log.e(TAG, "loop: IllegalAccessException: " + e);
        }
        catch (InvocationTargetException e) {
            Log.e(TAG, "loop: InvocationTargetException: " + e);
        }
    }
}